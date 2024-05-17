import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';

Future<HttpResponse<T>> getUserByUsernameRepo<T>(String username) async {
  var res = await getDataWithToken<T>('/users/$username', null, true);

  return res;
}

// Future<HttpResponse> topupRepo(TopupRequestModel data) async {
//   var res = await postDataWithToken('/top_ups', data);

//   return res;
// }
