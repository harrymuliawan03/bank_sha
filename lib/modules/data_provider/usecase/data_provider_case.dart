import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/repository/data_provider_repo.dart';

Future<ResponseUseCase<List<DataProviderModel>>> getDataProvidersCase() async {
  var res = await getDataProvidersRepo<List<Map<String, dynamic>>>();
  print(res);

  if (res.success) {
    List<DataProviderModel> data = List<DataProviderModel>.from(res.response!
        .map((dataProvider) => DataProviderModel.fromJson(dataProvider)));

    return ResponseUseCase<List<DataProviderModel>>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<List<DataProviderModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<dynamic>> postDataPackageCase(
    DataPlanRequestModel data) async {
  var res = await postDataPackageRepo(data);

  if (res.success) {
    return ResponseUseCase<dynamic>(
      valid: true,
      message: res.message,
      data: null,
    );
  } else {
    return ResponseUseCase<dynamic>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}
