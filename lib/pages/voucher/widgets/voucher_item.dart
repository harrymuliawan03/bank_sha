import 'package:bank_sha/modules/data_provider/models/data_plan_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  final String title;
  final int price;
  final String description;
  final bool isSelected;

  const VoucherItem({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? kBlueColor : kWhiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            description,
            style: greyTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatCurrency(price),
            style: blackTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
