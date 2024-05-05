import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';

Future<HttpResponse<T>> getRecentUsersRepo<T>() async {
  var res =
      await getDataWithToken<T>('/transfer_histories?limit=10', null, true);

  return res;
}
