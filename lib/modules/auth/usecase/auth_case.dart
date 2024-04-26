import 'dart:convert';

import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/auth/models/check_email_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/modules/auth/repositories/auth_repo.dart';
import 'package:bank_sha/modules/auth/services/auth_services.dart';

Future<ResponseUseCase<UserModel>> loginCase(SignInFormModel data) async {
  var res = await loginRepo<Map<String, dynamic>>(
    data,
  );

  if (res.valid) {
    final user = UserModel.fromJson(res.data!);
    user.password = data.password;

    await AuthServices().storeCredentialToLocal(user);

    return ResponseUseCase<UserModel>(
      valid: true,
      message: res.message,
      data: user,
    );
  } else {
    return ResponseUseCase<UserModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<UserModel>> registerCase(SignUpFormModel data) async {
  var res = await registerRepo<Map<String, dynamic>>(
    data,
  );

  if (res.valid) {
    final user = UserModel.fromJson(res.data!);
    // await AuthServices().storeCredentialToLocal(user);
    return ResponseUseCase<UserModel>(
      valid: true,
      message: res.message,
      data: user,
    );
  } else {
    return ResponseUseCase<UserModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<bool>> checkEmailExistCase(
    CheckEmailFormModel email) async {
  var res = await checkEmailExistRepo<Map<String, dynamic>>(
    email,
  );

  if (res.valid) {
    return ResponseUseCase<bool>(
      valid: true,
      message: res.message,
      data: res.data!['is_email_exist'],
    );
  } else {
    return ResponseUseCase<bool>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<UserModel>> getProfileCase(SignInFormModel data) async {
  var res = await getUserRepo<UserModel>(
    data,
  );

  if (res.success) {
    final user = UserModel.fromJson(res.data!);
    return ResponseUseCase<UserModel>(
      valid: true,
      message: res.message,
      data: user,
    );
  } else {
    return ResponseUseCase<UserModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase> logoutCase() async {
  var res = await logoutRepo<Map<String, dynamic>>();

  if (res.valid) {
    await AuthServices().clearLocalStorage();
    return ResponseUseCase(
      valid: true,
      message: 'Logout successfully',
      data: null,
    );
  }
  return ResponseUseCase(
    valid: false,
    message: res.message ?? 'Logout failed',
    data: null,
  );
}
