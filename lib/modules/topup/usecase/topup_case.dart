import 'dart:convert';

import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/modules/topup/models/payment_method_model.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/modules/topup/models/topup_response_model.dart';
import 'package:bank_sha/modules/topup/repositories/topup_repo.dart';

Future<ResponseUseCase<List<PaymentMethodModel>>> getPaymentMethodCase() async {
  var res = await getPaymentMethodRepo<List<Map<String, dynamic>>>();

  if (res.success) {
    List<PaymentMethodModel> data = List<PaymentMethodModel>.from(res.response!
        .map((paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)));

    return ResponseUseCase<List<PaymentMethodModel>>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<List<PaymentMethodModel>>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}

Future<ResponseUseCase<TopupResponseModel>> topupCase(
    TopupRequestModel data) async {
  var res = await topupRepo(data);

  if (res.success) {
    TopupResponseModel data = TopupResponseModel.fromJson(res.response);

    return ResponseUseCase<TopupResponseModel>(
      valid: true,
      message: res.message,
      data: data,
    );
  } else {
    return ResponseUseCase<TopupResponseModel>(
      valid: false,
      message: res.message ?? 'Failed to fetch data',
    );
  }
}
