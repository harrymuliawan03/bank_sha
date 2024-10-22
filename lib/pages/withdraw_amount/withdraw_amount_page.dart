import 'package:bank_sha/modules/topup/presentasions/topup_amount_content.dart';
import 'package:bank_sha/modules/withdraw/models/withdraw_request_model.dart';
import 'package:bank_sha/modules/withdraw/presentasions/withdraw_amount_content.dart';
import 'package:flutter/material.dart';

class WithdrawAmountPage extends StatelessWidget {
  const WithdrawAmountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WithdrawAmountContent();
  }
}
