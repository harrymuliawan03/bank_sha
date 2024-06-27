import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/repositories/user_repo.dart';
import 'package:bank_sha/testing/testing_repo.dart';

class TestingUserCase implements TestingRepo {
  TestingUserCase._();
  static Future<ResponseUseCase<List<UserModel>>> getUserByUsernameCase(
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

  static Future<ResponseUseCase<List<UserModel>>> getRecentUsersCase() async {
    var res = await getRecentUsersRepo<List<Map<String, dynamic>>>();

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
}
