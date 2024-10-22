import 'package:bank_sha/modules/topup/models/payment_method_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class MethodItem extends StatelessWidget {
  final String urlImage;
  final String paymentMethodName;
  final int adminFee;
  final bool isSelected;
  final bool disabled;

  const MethodItem({
    Key? key,
    required this.urlImage,
    required this.paymentMethodName,
    required this.adminFee,
    this.disabled = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.7 : 1,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? kBlueColor : kWhiteColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/$urlImage',
              height: 15,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paymentMethodName,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Biaya admin ${formatCurrency(adminFee)}',
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}
