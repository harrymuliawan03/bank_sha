import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_form_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_pin_form_model.dart';

Future<ResponseUseCase<T>> editProfileRepo<T>(ProfileEditFormModel data) async {
  print(data);
  var res = await putDataWithToken<T>(
    '/users',
    data,
  );

  return res;
}

Future<ResponseUseCase<T>> editPinRepo<T>(ProfileEditPinFormModel data) async {
  var res = await putDataWithToken<T>(
    '/wallets',
    data,
  );

  return res;
}
