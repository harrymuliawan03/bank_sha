import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          Image.network(
            transaction.transactionType!.thumbnail!,
            errorBuilder: (context, error, stackTrace) {
              return Text(transaction.transactionType!.name!);
            },
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  // dateToMonthDate(DateTime.parse(transaction.createdAt!)),
                  dateToMonthDate(DateTime.parse(transaction.createdAt!)),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            (transaction.transactionType?.action == 'cr' ? '+ ' : '- ') +
                formatTransactionCurrency(transaction.amount!),
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
                color: transaction.transactionType?.action == 'cr'
                    ? kGreenColor
                    : kRedColor),
          ),
        ],
      ),
    );
  }
}
