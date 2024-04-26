import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/pages/data_provider/widgets/data_provider_item.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  // OperatorCardModel? selectedOperator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data',
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
            'From Wallet',
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
                    'Balance: Rp 180.000.000',
                    // state.data.name!,
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
            'Select Provider',
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
                onTap: () {
                  // setState(() {
                  //   selectedOperator = operator;
                  // });
                },
                child: DataProviderItem(
                  // operator: operator,
                  isSelected: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedOperator = operator;
                  // });
                },
                child: DataProviderItem(
                  // operator: operator,
                  isSelected: false,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          // if (selectedOperator != null)
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              context
                  .goNamed(RouteNames.dataPackage, pathParameters: {'id': '2'});
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DataPackagePage(
              //       operator: selectedOperator!,
              //     ),
              //   ),
              // );
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
