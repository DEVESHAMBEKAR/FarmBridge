// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_checklist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationChecklistModel _$VerificationChecklistModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationChecklistModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationChecklistModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_type')
  String get entityType => throw _privateConstructorUsedError;
  Map<String, bool> get checks =>
      throw _privateConstructorUsedError; // e.g., {'Identity verified': true, 'Profile information verified': false}
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by')
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationChecklistModelCopyWith<VerificationChecklistModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationChecklistModelCopyWith<$Res> {
  factory $VerificationChecklistModelCopyWith(VerificationChecklistModel value,
          $Res Function(VerificationChecklistModel) then) =
      _$VerificationChecklistModelCopyWithImpl<$Res,
          VerificationChecklistModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entity_type') String entityType,
      Map<String, bool> checks,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
      @JsonKey(name: 'updated_by') String? updatedBy});
}

/// @nodoc
class _$VerificationChecklistModelCopyWithImpl<$Res,
        $Val extends VerificationChecklistModel>
    implements $VerificationChecklistModelCopyWith<$Res> {
  _$VerificationChecklistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? entityType = null,
    Object? checks = null,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      checks: null == checks
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationChecklistModelImplCopyWith<$Res>
    implements $VerificationChecklistModelCopyWith<$Res> {
  factory _$$VerificationChecklistModelImplCopyWith(
          _$VerificationChecklistModelImpl value,
          $Res Function(_$VerificationChecklistModelImpl) then) =
      __$$VerificationChecklistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entity_type') String entityType,
      Map<String, bool> checks,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
      @JsonKey(name: 'updated_by') String? updatedBy});
}

/// @nodoc
class __$$VerificationChecklistModelImplCopyWithImpl<$Res>
    extends _$VerificationChecklistModelCopyWithImpl<$Res,
        _$VerificationChecklistModelImpl>
    implements _$$VerificationChecklistModelImplCopyWith<$Res> {
  __$$VerificationChecklistModelImplCopyWithImpl(
      _$VerificationChecklistModelImpl _value,
      $Res Function(_$VerificationChecklistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? entityType = null,
    Object? checks = null,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$VerificationChecklistModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      checks: null == checks
          ? _value._checks
          : checks // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationChecklistModelImpl implements _VerificationChecklistModel {
  const _$VerificationChecklistModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'entity_type') required this.entityType,
      final Map<String, bool> checks = const {},
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt,
      @JsonKey(name: 'updated_by') this.updatedBy})
      : _checks = checks;

  factory _$VerificationChecklistModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerificationChecklistModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'entity_type')
  final String entityType;
  final Map<String, bool> _checks;
  @override
  @JsonKey()
  Map<String, bool> get checks {
    if (_checks is EqualUnmodifiableMapView) return _checks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_checks);
  }

// e.g., {'Identity verified': true, 'Profile information verified': false}
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'updated_by')
  final String? updatedBy;

  @override
  String toString() {
    return 'VerificationChecklistModel(userId: $userId, entityType: $entityType, checks: $checks, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationChecklistModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            const DeepCollectionEquality().equals(other._checks, _checks) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, entityType,
      const DeepCollectionEquality().hash(_checks), updatedAt, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationChecklistModelImplCopyWith<_$VerificationChecklistModelImpl>
      get copyWith => __$$VerificationChecklistModelImplCopyWithImpl<
          _$VerificationChecklistModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationChecklistModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationChecklistModel
    implements VerificationChecklistModel {
  const factory _VerificationChecklistModel(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'entity_type') required final String entityType,
          final Map<String, bool> checks,
          @JsonKey(name: 'updated_at')
          @TimestampConverter()
          final DateTime? updatedAt,
          @JsonKey(name: 'updated_by') final String? updatedBy}) =
      _$VerificationChecklistModelImpl;

  factory _VerificationChecklistModel.fromJson(Map<String, dynamic> json) =
      _$VerificationChecklistModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'entity_type')
  String get entityType;
  @override
  Map<String, bool> get checks;
  @override // e.g., {'Identity verified': true, 'Profile information verified': false}
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'updated_by')
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$VerificationChecklistModelImplCopyWith<_$VerificationChecklistModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
