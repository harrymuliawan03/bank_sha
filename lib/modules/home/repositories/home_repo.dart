import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';

Future<HttpResponse<T>> getTransactionsRepo<T>() async {
  var res = await getDataWithToken<T>('/transactions?limit=10', null, true);

  res = res.copyWith(response: res.response['data']);

  return res;
}

Future<HttpResponse<T>> getTipsRepo<T>() async {
  var res = await getDataWithToken<T>('/tips', null, true);

  res = res.copyWith(response: res.response['data']);

  return res;
}
