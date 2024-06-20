import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_plan_request_model.freezed.dart';
part 'data_plan_request_model.g.dart';

@freezed
class DataPlanRequestModel with _$DataPlanRequestModel {
  const factory DataPlanRequestModel({
    @JsonKey(name: 'data_plan_id') String? dataPlanId,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'pin') String? pin,
  }) = _DataPlanRequestModel;

  factory DataPlanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DataPlanRequestModelFromJson(json);
}
