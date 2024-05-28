import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/models/tips_model.dart';
import 'package:bank_sha/modules/home/repositories/home_repo.dart';

Future<ResponseUseCase<List<TransactionModel>>> getTransactionsCase() async {
  var res = await getTransactionsRepo<List<Map<String, dynamic>>>();

  if (res.success) {
    List<TransactionModel> data = List<TransactionModel>.from(res.response!
        .map((paymentMethod) => TransactionModel.fromJson(paymentMethod)));

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
