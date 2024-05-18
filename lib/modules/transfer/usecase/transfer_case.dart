import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/topup/repositories/topup_repo.dart';
import 'package:bank_sha/modules/transfer/models/transfer_request_model.dart';
import 'package:bank_sha/modules/transfer/repositories/transfer_repo.dart';

Future<ResponseUseCase<List<UserModel>>> getUserByUsernameCase(
    String username) async {
  var res = await getUserByUsernameRepo<List<Map<String, dynamic>>>(username);

  if (res.success) {
    List<UserModel> data = List<UserModel>.from(res.response!
        .map((paymentMethod) => UserModel.fromJson(paymentMethod)));

    return ResponseUseCase<List<UserModel>>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<List<UserModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<List<UserModel>>> transferCase(
    TransferRequestModel data) async {
  var res = await transferRepo(data);

  if (res.success) {
    return ResponseUseCase<List<UserModel>>(
      valid: true,
      message: res.message,
      data: null,
    );
  } else {
    return ResponseUseCase<List<UserModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}
