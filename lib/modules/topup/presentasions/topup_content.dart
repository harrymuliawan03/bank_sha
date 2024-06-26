import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/topup/models/payment_method_model.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/modules/topup/presentasions/widgets/bank_item.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopupContent extends StatefulWidget {
  const TopupContent({Key? key}) : super(key: key);

  @override
  State<TopupContent> createState() => _TopupContentState();
}

class _TopupContentState extends State<TopupContent> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: EdgeInsets.all(defaultMargin),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  context.goNamed(
                    RouteNames.topupAmount,
                    extra: TopupRequestModel(
                      paymentMethodCode: selectedPaymentMethod?.code,
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Wallet',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name ?? '',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Bank',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                BlocProvider(
                  create: (context) =>
                      PaymentMethodBloc()..add(PaymentMethodGet()),
                  child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                    builder: (context, state) {
                      if (state is PaymentMethodSuccess) {
                        return Column(
                          children: state.paymentMethods.map(
                            (paymentMethod) {
                              return GestureDetector(
                                child: BankItem(
                                  paymentMethod: paymentMethod,
                                  isSelected: paymentMethod.id ==
                                      selectedPaymentMethod?.id,
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedPaymentMethod = paymentMethod;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
