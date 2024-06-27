import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';

class TestingRepo {
  static Future<HttpResponse<T>> getUserByUsernameRepo<T>(
      String username) async {
    var res = await getDataWithToken<T>('/users/$username', null, true);

    return res;
  }

  static Future<HttpResponse<T>> getRecentUsersRepo<T>() async {
    var res =
        await getDataWithToken<T>('/transfer_histories?limit=10', null, true);

    return res.copyWith(response: res.response['data']);
  }
}
