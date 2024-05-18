import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/transfer/models/transfer_request_model.dart';

Future<HttpResponse<T>> getUserByUsernameRepo<T>(String username) async {
  var res = await getDataWithToken<T>('/users/$username', null, true);

  return res;
}

Future<HttpResponse> transferRepo(TransferRequestModel data) async {
  var res = await postDataWithToken('/transfers', data);

  return res;
}
