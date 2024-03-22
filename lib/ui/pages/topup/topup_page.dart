import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/topup/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
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
                    '8008 2208 1996',
                    // state.data.cardNumber!.replaceAllMapped(
                    //     RegExp(r".{4}"), (match) => "${match.group(0)} "),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Wesley Sananta',
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
          Column(children: [
            GestureDetector(
              onTap: () {
                // setState(() {
                //   selectedPaymentMethod = paymentMethod;
                // });
              },
              child: const BankItem(
                isSelected: true,
                // data: paymentMethod,
                // isSelected:
                //     paymentMethod.id == selectedPaymentMethod?.id,
              ),
            ),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   selectedPaymentMethod = paymentMethod;
                // });
              },
              child: const BankItem(
                  // data: paymentMethod,
                  // isSelected:
                  //     paymentMethod.id == selectedPaymentMethod?.id,
                  ),
            ),
          ]),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              context.goNamed(RouteNames.topupAmount);
              // if (selectedPaymentMethod != null) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => TopupAmountPage(
              //         data: TopupFormModel(
              //           paymentMethodCode: selectedPaymentMethod?.code,
              //         ),
              //       ),
              //     ),
              //   );
              // }
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
