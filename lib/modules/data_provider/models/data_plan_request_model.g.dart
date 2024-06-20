// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_plan_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataPlanRequestModelImpl _$$DataPlanRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataPlanRequestModelImpl(
      dataPlanId: json['data_plan_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$$DataPlanRequestModelImplToJson(
        _$DataPlanRequestModelImpl instance) =>
    <String, dynamic>{
      'data_plan_id': instance.dataPlanId,
      'phone_number': instance.phoneNumber,
      'pin': instance.pin,
    };
