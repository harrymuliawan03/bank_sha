import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/database/services/service_database.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/models/tips_model.dart';
import 'package:bank_sha/modules/home/repositories/home_repo.dart';
import 'package:drift/drift.dart';

Future<ResponseUseCase<List<TransactionModel>>> getTransactionsCase(
    AppDatabase db) async {
  var res = await getTransactionsRepo<List<Map<String, dynamic>>>();

  if (res.success) {
    List<TransactionModel> data = [];

    for (var transaction in res.response!) {
      final transactionData = TransactionModel.fromJson(transaction);

      await ServiceDatabase.insertData(
          db,
          db.transactionTypes,
          TransactionTypesCompanion.insert(
            id: Value(transactionData.transactionType!.id!),
            code: Value(transactionData.transactionType!.code!),
            name: Value(transactionData.transactionType!.name!),
            action: Value(transactionData.transactionType!.action!),
            thumbnail: Value(transactionData.transactionType!.thumbnail!),
          ));

      await ServiceDatabase.insertData(
          db,
          db.transactions,
          TransactionsCompanion.insert(
            id: Value(transactionData.id!),
            amount: transactionData.amount!,
            createdAt: transactionData.createdAt!,
            transactionTypeId: transactionData.transactionType!.id!,
          ));

      data.add(transactionData);
    }

    return ResponseUseCase<List<TransactionModel>>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<List<TransactionModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<List<TipsModel>>> getTipsCase() async {
  var res = await getTipsRepo<List<Map<String, dynamic>>>();

  if (res.success) {
    List<TipsModel> data = List<TipsModel>.from(res.response!
        .map((paymentMethod) => TipsModel.fromJson(paymentMethod)));

    return ResponseUseCase<List<TipsModel>>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<List<TipsModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}
