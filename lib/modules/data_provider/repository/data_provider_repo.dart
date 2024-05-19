import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';

Future<HttpResponse<T>> getDataProvidersRepo<T>() async {
  var res = await getDataWithToken<T>('/operator_cards', null, true);

  return res.copyWith(response: res.response['data']);
}

Future<HttpResponse> postDataPackageRepo(DataPlanRequestModel data) async {
  var res = await postDataWithToken('/data_plans', data);

  return res;
}
