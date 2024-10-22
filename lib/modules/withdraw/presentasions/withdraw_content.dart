import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/topup/models/payment_method_model.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/modules/withdraw/presentasions/widgets/method_item.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WithdrawContent extends StatefulWidget {
  const WithdrawContent({Key? key}) : super(key: key);

  @override
  State<WithdrawContent> createState() => WithdrawContentState();
}

class WithdrawContentState extends State<WithdrawContent> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Penarikan',
        ),
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: EdgeInsets.all(defaultMargin),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  context.goNamed(
                    RouteNames.withdrawAmount,
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
                  height: 10,
                ),
                Text(
                  'Saldo Z-Wallet Cash: ${formatCurrency(state.user.balance ?? 0)}',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Metode Penarikan',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: MethodItem(
                        adminFee: 5000,
                        paymentMethodName: 'ATM BCA',
                        urlImage: 'bca.png',
                        isSelected: selectedPaymentMethod == 'bca',
                        disabled: true,
                      ),
                      // onTap: () {
                      //   setState(() {
                      //     // selectedPaymentMethod = 'bca';
                      //   });
                      // },
                    ),
                    GestureDetector(
                      child: MethodItem(
                        adminFee: 5000,
                        paymentMethodName: 'Indomaret',
                        urlImage: 'idm.png',
                        isSelected: selectedPaymentMethod == 'idm',
                      ),
                      onTap: () {
                        setState(() {
                          selectedPaymentMethod = 'idm';
                        });
                      },
                    ),
                  ],
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
