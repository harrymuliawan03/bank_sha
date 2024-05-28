import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    List _elements = [
      {
        'message': 'Transaksi sebesar Rp23.000 di MYTELKOMSEL, telah berhasil.',
        'group': '22 Mei 2024'
      },
      {
        'message':
            'Rp1.000 telah dipotong dari Saldo untuk biaya top up dari BCA',
        'group': '22 Mei 2024'
      },
    ];
    return BlocProvider(
      create: (context) => TransactionBloc()..add(TransactionsGet()),
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionSuccess) {
              if (state.transactions.isNotEmpty) {
                return Column(
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
