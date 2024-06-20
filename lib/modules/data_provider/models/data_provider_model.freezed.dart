// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataProviderModel _$DataProviderModelFromJson(Map<String, dynamic> json) {
  return _DataProviderModel.fromJson(json);
}

/// @nodoc
mixin _$DataProviderModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_plans')
  List<DataPlanModel>? get dataPlans => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataProviderModelCopyWith<DataProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataProviderModelCopyWith<$Res> {
  factory $DataProviderModelCopyWith(
          DataProviderModel value, $Res Function(DataProviderModel) then) =
      _$DataProviderModelCopyWithImpl<$Res, DataProviderModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? status,
      String? thumbnail,
      @JsonKey(name: 'data_plans') List<DataPlanModel>? dataPlans});
}

/// @nodoc
class _$DataProviderModelCopyWithImpl<$Res, $Val extends DataProviderModel>
    implements $DataProviderModelCopyWith<$Res> {
  _$DataProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? thumbnail = freezed,
    Object? dataPlans = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPlans: freezed == dataPlans
          ? _value.dataPlans
          : dataPlans // ignore: cast_nullable_to_non_nullable
              as List<DataPlanModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataProviderModelImplCopyWith<$Res>
    implements $DataProviderModelCopyWith<$Res> {
  factory _$$DataProviderModelImplCopyWith(_$DataProviderModelImpl value,
          $Res Function(_$DataProviderModelImpl) then) =
      __$$DataProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? status,
      String? thumbnail,
      @JsonKey(name: 'data_plans') List<DataPlanModel>? dataPlans});
}

/// @nodoc
class __$$DataProviderModelImplCopyWithImpl<$Res>
    extends _$DataProviderModelCopyWithImpl<$Res, _$DataProviderModelImpl>
    implements _$$DataProviderModelImplCopyWith<$Res> {
  __$$DataProviderModelImplCopyWithImpl(_$DataProviderModelImpl _value,
      $Res Function(_$DataProviderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? thumbnail = freezed,
    Object? dataPlans = freezed,
  }) {
    return _then(_$DataProviderModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPlans: freezed == dataPlans
          ? _value._dataPlans
          : dataPlans // ignore: cast_nullable_to_non_nullable
              as List<DataPlanModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataProviderModelImpl implements _DataProviderModel {
  _$DataProviderModelImpl(
      {this.id,
      this.name,
      this.status,
      this.thumbnail,
      @JsonKey(name: 'data_plans') final List<DataPlanModel>? dataPlans})
      : _dataPlans = dataPlans;

  factory _$DataProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataProviderModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? thumbnail;
  final List<DataPlanModel>? _dataPlans;
  @override
  @JsonKey(name: 'data_plans')
  List<DataPlanModel>? get dataPlans {
    final value = _dataPlans;
    if (value == null) return null;
    if (_dataPlans is EqualUnmodifiableListView) return _dataPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataProviderModel(id: $id, name: $name, status: $status, thumbnail: $thumbnail, dataPlans: $dataPlans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataProviderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality()
                .equals(other._dataPlans, _dataPlans));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, thumbnail,
      const DeepCollectionEquality().hash(_dataPlans));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataProviderModelImplCopyWith<_$DataProviderModelImpl> get copyWith =>
      __$$DataProviderModelImplCopyWithImpl<_$DataProviderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataProviderModelImplToJson(
      this,
    );
  }
}

abstract class _DataProviderModel implements DataProviderModel {
  factory _DataProviderModel(
          {final int? id,
          final String? name,
          final String? status,
          final String? thumbnail,
          @JsonKey(name: 'data_plans') final List<DataPlanModel>? dataPlans}) =
      _$DataProviderModelImpl;

  factory _DataProviderModel.fromJson(Map<String, dynamic> json) =
      _$DataProviderModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get status;
  @override
  String? get thumbnail;
  @override
  @JsonKey(name: 'data_plans')
  List<DataPlanModel>? get dataPlans;
  @override
  @JsonKey(ignore: true)
  _$$DataProviderModelImplCopyWith<_$DataProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
