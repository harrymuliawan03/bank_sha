import 'package:meta/meta.dart';
import 'dart:convert';

String dataPlanRequestModelToJson(DataPlanRequestModel data) =>
    json.encode(data.toJson());

class DataPlanRequestModel {
  final String? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  DataPlanRequestModel({
    this.dataPlanId,
    this.phoneNumber,
    this.pin,
  });

  DataPlanRequestModel copyWith({
    String? dataPlanId,
    String? phoneNumber,
    String? pin,
  }) =>
      DataPlanRequestModel(
        dataPlanId: dataPlanId ?? this.dataPlanId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        pin: pin ?? this.pin,
      );

  Map<String, dynamic> toJson() => {
        "data_plan_id": dataPlanId,
        "phone_number": phoneNumber,
        "pin": pin,
      };
}
