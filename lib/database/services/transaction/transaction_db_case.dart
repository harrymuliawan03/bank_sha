import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:drift/drift.dart';

class TransactionDbCase {
  const TransactionDbCase._();
  static Future<List<TransactionModel>> getTransactions(AppDatabase db) async {
    try {
      final query = db.select(db.transactions).join(
        [
          leftOuterJoin(
            db.transactionTypes,
            db.transactionTypes.id.equalsExp(db.transactions.transactionTypeId),
          ),
        ],
      )..orderBy([
          OrderingTerm(
              expression: db.transactions.createdAt, mode: OrderingMode.desc),
        ]);

      final result = await query.get();

      final transactionsWithTypes = result.map((row) {
        final transaction = row.readTable(db.transactions);
        final transactionType = row.readTable(db.transactionTypes);
        return TransactionModel(
          id: transaction.id,
          amount: transaction.amount,
          createdAt: transaction.createdAt,
          transactionType: (transactionType as TransactionType?) != null
              ? TransactionTypeModel.fromData(transactionType)
              : null,
        );
      }).toList();

      return transactionsWithTypes;
    } catch (e) {
      print('Error fetching transactions: $e');
      return [];
    }
  }
}
