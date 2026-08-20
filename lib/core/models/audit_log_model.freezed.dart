// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuditLogModel _$AuditLogModelFromJson(Map<String, dynamic> json) {
  return _AuditLogModel.fromJson(json);
}

/// @nodoc
mixin _$AuditLogModel {
  @JsonKey(name: 'log_id')
  String get logId => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_id')
  String get adminId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_type')
  String get entityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id')
  String get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_value')
  String? get oldValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_value')
  String? get newValue => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditLogModelCopyWith<AuditLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditLogModelCopyWith<$Res> {
  factory $AuditLogModelCopyWith(
          AuditLogModel value, $Res Function(AuditLogModel) then) =
      _$AuditLogModelCopyWithImpl<$Res, AuditLogModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'log_id') String logId,
      @JsonKey(name: 'admin_id') String adminId,
      String action,
      @JsonKey(name: 'entity_type') String entityType,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'old_value') String? oldValue,
      @JsonKey(name: 'new_value') String? newValue,
      String? reason,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class _$AuditLogModelCopyWithImpl<$Res, $Val extends AuditLogModel>
    implements $AuditLogModelCopyWith<$Res> {
  _$AuditLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? adminId = null,
    Object? action = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? reason = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      logId: null == logId
          ? _value.logId
          : logId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuditLogModelImplCopyWith<$Res>
    implements $AuditLogModelCopyWith<$Res> {
  factory _$$AuditLogModelImplCopyWith(
          _$AuditLogModelImpl value, $Res Function(_$AuditLogModelImpl) then) =
      __$$AuditLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'log_id') String logId,
      @JsonKey(name: 'admin_id') String adminId,
      String action,
      @JsonKey(name: 'entity_type') String entityType,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'old_value') String? oldValue,
      @JsonKey(name: 'new_value') String? newValue,
      String? reason,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class __$$AuditLogModelImplCopyWithImpl<$Res>
    extends _$AuditLogModelCopyWithImpl<$Res, _$AuditLogModelImpl>
    implements _$$AuditLogModelImplCopyWith<$Res> {
  __$$AuditLogModelImplCopyWithImpl(
      _$AuditLogModelImpl _value, $Res Function(_$AuditLogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? adminId = null,
    Object? action = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? reason = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$AuditLogModelImpl(
      logId: null == logId
          ? _value.logId
          : logId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditLogModelImpl implements _AuditLogModel {
  const _$AuditLogModelImpl(
      {@JsonKey(name: 'log_id') required this.logId,
      @JsonKey(name: 'admin_id') required this.adminId,
      required this.action,
      @JsonKey(name: 'entity_type') required this.entityType,
      @JsonKey(name: 'entity_id') required this.entityId,
      @JsonKey(name: 'old_value') this.oldValue,
      @JsonKey(name: 'new_value') this.newValue,
      this.reason,
      @TimestampConverter() this.timestamp});

  factory _$AuditLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditLogModelImplFromJson(json);

  @override
  @JsonKey(name: 'log_id')
  final String logId;
  @override
  @JsonKey(name: 'admin_id')
  final String adminId;
  @override
  final String action;
  @override
  @JsonKey(name: 'entity_type')
  final String entityType;
  @override
  @JsonKey(name: 'entity_id')
  final String entityId;
  @override
  @JsonKey(name: 'old_value')
  final String? oldValue;
  @override
  @JsonKey(name: 'new_value')
  final String? newValue;
  @override
  final String? reason;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  @override
  String toString() {
    return 'AuditLogModel(logId: $logId, adminId: $adminId, action: $action, entityType: $entityType, entityId: $entityId, oldValue: $oldValue, newValue: $newValue, reason: $reason, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditLogModelImpl &&
            (identical(other.logId, logId) || other.logId == logId) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, logId, adminId, action,
      entityType, entityId, oldValue, newValue, reason, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditLogModelImplCopyWith<_$AuditLogModelImpl> get copyWith =>
      __$$AuditLogModelImplCopyWithImpl<_$AuditLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditLogModelImplToJson(
      this,
    );
  }
}

abstract class _AuditLogModel implements AuditLogModel {
  const factory _AuditLogModel(
      {@JsonKey(name: 'log_id') required final String logId,
      @JsonKey(name: 'admin_id') required final String adminId,
      required final String action,
      @JsonKey(name: 'entity_type') required final String entityType,
      @JsonKey(name: 'entity_id') required final String entityId,
      @JsonKey(name: 'old_value') final String? oldValue,
      @JsonKey(name: 'new_value') final String? newValue,
      final String? reason,
      @TimestampConverter() final DateTime? timestamp}) = _$AuditLogModelImpl;

  factory _AuditLogModel.fromJson(Map<String, dynamic> json) =
      _$AuditLogModelImpl.fromJson;

  @override
  @JsonKey(name: 'log_id')
  String get logId;
  @override
  @JsonKey(name: 'admin_id')
  String get adminId;
  @override
  String get action;
  @override
  @JsonKey(name: 'entity_type')
  String get entityType;
  @override
  @JsonKey(name: 'entity_id')
  String get entityId;
  @override
  @JsonKey(name: 'old_value')
  String? get oldValue;
  @override
  @JsonKey(name: 'new_value')
  String? get newValue;
  @override
  String? get reason;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$AuditLogModelImplCopyWith<_$AuditLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
