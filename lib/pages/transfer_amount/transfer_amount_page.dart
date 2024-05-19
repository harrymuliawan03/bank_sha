import 'package:bank_sha/modules/transfer/models/transfer_request_model.dart';
import 'package:bank_sha/modules/transfer/presentasions/transfer_amount_content.dart';
import 'package:flutter/material.dart';

class TransferAmountPage extends StatelessWidget {
  final TransferRequestModel data;
  const TransferAmountPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return TransferAmountContent(data: data);
  }
}
