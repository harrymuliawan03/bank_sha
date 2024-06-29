import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDatabase db = AppDatabase();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 0),
      padding: const EdgeInsets.all(0),
      child: BlocProvider(
        create: (context) => TransactionBloc()..add(TransactionsGet(db)),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionSuccess) {
              if (state.transactions.isNotEmpty) {
                return ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    children: state.transactions
                        .map((item) => HomeLatestTransactionItem(
                              transaction: item,
                            ))
                        .toList());
              }
              return Center(
                child: Text(
                  'There is no transaction',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
