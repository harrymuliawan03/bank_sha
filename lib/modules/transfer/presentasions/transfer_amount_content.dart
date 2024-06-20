import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transfer/transfer_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/transfer/models/transfer_request_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferAmountContent extends StatefulWidget {
  final TransferRequestModel data;

  const TransferAmountContent({
    super.key,
    required this.data,
  });

  @override
  State<TransferAmountContent> createState() => _TransferAmountContentState();
}

class _TransferAmountContentState extends State<TransferAmountContent> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    amountController.dispose();
  }

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }

    if (amountController.text.length < 10) {
      setState(() {
        amountController.text = amountController.text + number;
      });
    }
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkBackgroundColor,
        body: BlocProvider(
          create: (context) => TransferBloc(),
          child: BlocConsumer<TransferBloc, TransferState>(
            listener: (context, state) {
              if (state is TransferFailed) {
                showCustomSnackbar(context, state.e);
              }

              if (state is TransferSuccess) {
                if (context.mounted) {
                  context.read<AuthBloc>().add(
                        AuthUpdateBalance(
                          int.parse(
                              amountController.text.replaceAll('.', '') * -1),
                        ),
                      );

                  context.goNamed(RouteNames.transferSuccess);
                }
              }
            },
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 58,
                ),
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Total Amount',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                  TextFormField(
                    controller: amountController,
                    cursorColor: kGreyColor,
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Text(
                        'Rp ',
                        style: whiteTextStyle.copyWith(
                          fontSize: 36,
                          fontWeight: medium,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomInputButton(
                        title: '1',
                        onTap: () {
                          addAmount('1');
                        },
                      ),
                      CustomInputButton(
                        title: '2',
                        onTap: () {
                          addAmount('2');
                        },
                      ),
                      CustomInputButton(
                        title: '3',
                        onTap: () {
                          addAmount('3');
                        },
                      ),
                      CustomInputButton(
                        title: '4',
                        onTap: () {
                          addAmount('4');
                        },
                      ),
                      CustomInputButton(
                        title: '5',
                        onTap: () {
                          addAmount('5');
                        },
                      ),
                      CustomInputButton(
                        title: '6',
                        onTap: () {
                          addAmount('6');
                        },
                      ),
                      CustomInputButton(
                        title: '7',
                        onTap: () {
                          addAmount('7');
                        },
                      ),
                      CustomInputButton(
                        title: '8',
                        onTap: () {
                          addAmount('8');
                        },
                      ),
                      CustomInputButton(
                        title: '9',
                        onTap: () {
                          addAmount('9');
                        },
                      ),
                      const SizedBox(
                        width: 60,
                        height: 60,
                      ),
                      CustomInputButton(
                        title: '0',
                        onTap: () {
                          addAmount('0');
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteAmount();
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kNumberBackgroundColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFilledButton(
                    title: 'Transfer Now',
                    onPressed: () async {
                      if (int.parse(amountController.text.replaceAll('.', '')) <
                          20000) {
                        return showCustomSnackbar(
                            context, 'Minimal nominal transfer Rp. 20.000');
                      }
                      if (await GoRouter.of(context)
                              .pushNamed(RouteNames.checkPin) ==
                          true) {
                        if (context.mounted) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = '';
                          if (authState is AuthSuccess) {
                            pin = authState.user.pin!;
                          }

                          context.read<TransferBloc>().add(
                                TransferPost(
                                  widget.data.copyWith(
                                    pin: pin,
                                    amount: amountController.text
                                        .replaceAll(".", ''),
                                  ),
                                ),
                              );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextButton(
                    title: 'Terms & Conditions',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
