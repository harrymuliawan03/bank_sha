// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataPlanModel _$DataPlanModelFromJson(Map<String, dynamic> json) {
  return _DataPlanModel.fromJson(json);
}

/// @nodoc
mixin _$DataPlanModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get operatorCardId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataPlanModelCopyWith<DataPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPlanModelCopyWith<$Res> {
  factory $DataPlanModelCopyWith(
          DataPlanModel value, $Res Function(DataPlanModel) then) =
      _$DataPlanModelCopyWithImpl<$Res, DataPlanModel>;
  @useResult
  $Res call({int? id, String? name, int? price, int? operatorCardId});
}

/// @nodoc
class _$DataPlanModelCopyWithImpl<$Res, $Val extends DataPlanModel>
    implements $DataPlanModelCopyWith<$Res> {
  _$DataPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? operatorCardId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      operatorCardId: freezed == operatorCardId
          ? _value.operatorCardId
          : operatorCardId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPlanModelImplCopyWith<$Res>
    implements $DataPlanModelCopyWith<$Res> {
  factory _$$DataPlanModelImplCopyWith(
          _$DataPlanModelImpl value, $Res Function(_$DataPlanModelImpl) then) =
      __$$DataPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, int? price, int? operatorCardId});
}

/// @nodoc
class __$$DataPlanModelImplCopyWithImpl<$Res>
    extends _$DataPlanModelCopyWithImpl<$Res, _$DataPlanModelImpl>
    implements _$$DataPlanModelImplCopyWith<$Res> {
  __$$DataPlanModelImplCopyWithImpl(
      _$DataPlanModelImpl _value, $Res Function(_$DataPlanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? operatorCardId = freezed,
  }) {
    return _then(_$DataPlanModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      operatorCardId: freezed == operatorCardId
          ? _value.operatorCardId
          : operatorCardId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPlanModelImpl implements _DataPlanModel {
  const _$DataPlanModelImpl(
      {this.id, this.name, this.price, this.operatorCardId});

  factory _$DataPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPlanModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? price;
  @override
  final int? operatorCardId;

  @override
  String toString() {
    return 'DataPlanModel(id: $id, name: $name, price: $price, operatorCardId: $operatorCardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.operatorCardId, operatorCardId) ||
                other.operatorCardId == operatorCardId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, operatorCardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPlanModelImplCopyWith<_$DataPlanModelImpl> get copyWith =>
      __$$DataPlanModelImplCopyWithImpl<_$DataPlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPlanModelImplToJson(
      this,
    );
  }
}

abstract class _DataPlanModel implements DataPlanModel {
  const factory _DataPlanModel(
      {final int? id,
      final String? name,
      final int? price,
      final int? operatorCardId}) = _$DataPlanModelImpl;

  factory _DataPlanModel.fromJson(Map<String, dynamic> json) =
      _$DataPlanModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get price;
  @override
  int? get operatorCardId;
  @override
  @JsonKey(ignore: true)
  _$$DataPlanModelImplCopyWith<_$DataPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
