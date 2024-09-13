import 'package:bank_sha/blocs/mobil-cubit/transaction_cubit.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

class RewardContent extends StatelessWidget {
  const RewardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          // color: Colors.amber,
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16.0), // Radius for the corners
                  child: Image.asset(
                    'assets/promo2.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Road to Double Untung 9.9',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sebelum Double Untung 9.9, kamu tetep bisa nikmatin untungnya pake Bank Sha di Road to Double Untung 9.9! Beli pulsa, paket data, token PLN atau top-up e-Money dijamin hematnya.',
                style: blackTextStyle.copyWith(fontWeight: light, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Berlaku sampai 6 juni 2025',
                style: blackTextStyle.copyWith(fontWeight: light, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          // color: Colors.amber,
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16.0), // Radius for the corners
                  child: Image.asset(
                    'assets/promo1.jpeg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Road to Double Untung 9.9',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sebelum Double Untung 9.9, kamu tetep bisa nikmatin untungnya pake Bank Sha di Road to Double Untung 9.9! Beli pulsa, paket data, token PLN atau top-up e-Money dijamin hematnya.',
                style: blackTextStyle.copyWith(fontWeight: light, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Berlaku sampai 6 juni 2025',
                style: blackTextStyle.copyWith(fontWeight: light, fontSize: 12),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Update the transactions when the button is pressed
            context.read<TransactionCubit>().updateTransaction([
              'Transaction 1',
              'Transaction 2',
              'Transaction 3',
            ]);
          },
          child: Text('Update Transactions'),
        ),
        ElevatedButton(
          onPressed: () {
            // Update the transactions when the button is pressed
            context.read<TransactionCubit>().updateTransaction([
              'Transaction 3',
              'Transaction 2',
              'Transaction 1',
            ]);
          },
          child: Text('Update Transactions 2'),
        ),
        BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state.transactions.isEmpty) {
              return Center(child: Text('No transactions available'));
            }
            return Column(
              children: state.transactions.map((e) => Text(e)).toList(),
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
