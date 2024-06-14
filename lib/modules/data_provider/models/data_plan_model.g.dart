// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataPlanModelImpl _$$DataPlanModelImplFromJson(Map<String, dynamic> json) =>
    _$DataPlanModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      operatorCardId: (json['operatorCardId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DataPlanModelImplToJson(_$DataPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'operatorCardId': instance.operatorCardId,
    };
