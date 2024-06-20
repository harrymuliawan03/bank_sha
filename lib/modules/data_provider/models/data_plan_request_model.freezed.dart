// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_plan_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataPlanRequestModel _$DataPlanRequestModelFromJson(Map<String, dynamic> json) {
  return _DataPlanRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DataPlanRequestModel {
  @JsonKey(name: 'data_plan_id')
  String? get dataPlanId => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin')
  String? get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataPlanRequestModelCopyWith<DataPlanRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPlanRequestModelCopyWith<$Res> {
  factory $DataPlanRequestModelCopyWith(DataPlanRequestModel value,
          $Res Function(DataPlanRequestModel) then) =
      _$DataPlanRequestModelCopyWithImpl<$Res, DataPlanRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data_plan_id') String? dataPlanId,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'pin') String? pin});
}

/// @nodoc
class _$DataPlanRequestModelCopyWithImpl<$Res,
        $Val extends DataPlanRequestModel>
    implements $DataPlanRequestModelCopyWith<$Res> {
  _$DataPlanRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataPlanId = freezed,
    Object? phoneNumber = freezed,
    Object? pin = freezed,
  }) {
    return _then(_value.copyWith(
      dataPlanId: freezed == dataPlanId
          ? _value.dataPlanId
          : dataPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPlanRequestModelImplCopyWith<$Res>
    implements $DataPlanRequestModelCopyWith<$Res> {
  factory _$$DataPlanRequestModelImplCopyWith(_$DataPlanRequestModelImpl value,
          $Res Function(_$DataPlanRequestModelImpl) then) =
      __$$DataPlanRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data_plan_id') String? dataPlanId,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'pin') String? pin});
}

/// @nodoc
class __$$DataPlanRequestModelImplCopyWithImpl<$Res>
    extends _$DataPlanRequestModelCopyWithImpl<$Res, _$DataPlanRequestModelImpl>
    implements _$$DataPlanRequestModelImplCopyWith<$Res> {
  __$$DataPlanRequestModelImplCopyWithImpl(_$DataPlanRequestModelImpl _value,
      $Res Function(_$DataPlanRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataPlanId = freezed,
    Object? phoneNumber = freezed,
    Object? pin = freezed,
  }) {
    return _then(_$DataPlanRequestModelImpl(
      dataPlanId: freezed == dataPlanId
          ? _value.dataPlanId
          : dataPlanId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPlanRequestModelImpl implements _DataPlanRequestModel {
  const _$DataPlanRequestModelImpl(
      {@JsonKey(name: 'data_plan_id') this.dataPlanId,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'pin') this.pin});

  factory _$DataPlanRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPlanRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'data_plan_id')
  final String? dataPlanId;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'pin')
  final String? pin;

  @override
  String toString() {
    return 'DataPlanRequestModel(dataPlanId: $dataPlanId, phoneNumber: $phoneNumber, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPlanRequestModelImpl &&
            (identical(other.dataPlanId, dataPlanId) ||
                other.dataPlanId == dataPlanId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dataPlanId, phoneNumber, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPlanRequestModelImplCopyWith<_$DataPlanRequestModelImpl>
      get copyWith =>
          __$$DataPlanRequestModelImplCopyWithImpl<_$DataPlanRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPlanRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DataPlanRequestModel implements DataPlanRequestModel {
  const factory _DataPlanRequestModel(
      {@JsonKey(name: 'data_plan_id') final String? dataPlanId,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'pin') final String? pin}) = _$DataPlanRequestModelImpl;

  factory _DataPlanRequestModel.fromJson(Map<String, dynamic> json) =
      _$DataPlanRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'data_plan_id')
  String? get dataPlanId;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'pin')
  String? get pin;
  @override
  @JsonKey(ignore: true)
  _$$DataPlanRequestModelImplCopyWith<_$DataPlanRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
