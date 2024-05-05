import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/modules/topup/presentasions/topup_amount_content.dart';
import 'package:flutter/material.dart';

class TopupAmountPage extends StatelessWidget {
  final TopupRequestModel data;
  const TopupAmountPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return TopupAmountContent(
      data: data,
    );
  }
}
