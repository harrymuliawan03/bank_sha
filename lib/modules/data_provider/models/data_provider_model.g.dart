// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataProviderModelImpl _$$DataProviderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataProviderModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      thumbnail: json['thumbnail'] as String?,
      dataPlans: (json['data_plans'] as List<dynamic>?)
          ?.map((e) => DataPlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataProviderModelImplToJson(
        _$DataProviderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'thumbnail': instance.thumbnail,
      'data_plans': instance.dataPlans,
    };
