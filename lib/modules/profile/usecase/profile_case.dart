import 'dart:convert';

import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/auth/models/check_email_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/modules/auth/repositories/auth_repo.dart';
import 'package:bank_sha/modules/auth/services/auth_services.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_form_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_pin_form_model.dart';
import 'package:bank_sha/modules/profile/repositories/profile_repo.dart';

Future<ResponseUseCase<UserModel>> editProfileCase(
    ProfileEditFormModel data) async {
  var res = await editProfileRepo<Map<String, dynamic>>(
    data,
  );

  if (res.valid) {
    return ResponseUseCase<UserModel>(
      valid: true,
      message: res.message,
      data: null,
    );
  } else {
    return ResponseUseCase<UserModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<UserModel>> editPinCase(
    ProfileEditPinFormModel data) async {
  var res = await editPinRepo<Map<String, dynamic>>(data);

  if (res.valid) {
    return ResponseUseCase<UserModel>(
      valid: true,
      message: res.message,
      data: null,
    );
  } else {
    return ResponseUseCase<UserModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}
