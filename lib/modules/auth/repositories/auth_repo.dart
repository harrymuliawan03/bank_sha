import 'package:bank_sha/configs/api/core_api.dart';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/auth/models/check_email_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';

Future<ResponseUseCase<T>> loginRepo<T>(SignInFormModel data) async {
  var res = await postData<T>(
    '/login',
    data,
  );

  return res;
}

Future<ResponseUseCase<T>> registerRepo<T>(SignUpFormModel data) async {
  var res = await postData<T>(
    '/register',
    data,
  );

  return res;
}

Future<ResponseUseCase<T>> checkEmailExistRepo<T>(
    CheckEmailFormModel email) async {
  var res = await postData<T>(
    '/is-email-exist',
    email,
  );

  return res;
}

Future<HttpResponse> getUserRepo<T>(SignInFormModel data) async {
  var res = await getDataWithToken<T>('/profile', null);

  return res;
}

Future<ResponseUseCase<T>> logoutRepo<T>() async {
  var res = await postDataWithToken<T>('/logout', null);

  return res;
}
