import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';

Future<HttpResponse<T>> getPaymentMethodRepo<T>() async {
  var res = await getDataWithToken<T>('/payment_methods', null, true);

  return res;
}

Future<HttpResponse> topupRepo(TopupRequestModel data) async {
  var res = await postDataWithToken('/top_ups', data);

  return res;
}
