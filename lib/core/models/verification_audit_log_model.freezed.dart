// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_audit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationAuditLogModel _$VerificationAuditLogModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationAuditLogModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationAuditLogModel {
  @JsonKey(name: 'audit_id')
  String get auditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_id')
  String get adminId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id')
  String get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_type')
  String get entityType => throw _privateConstructorUsedError;
  String get action =>
      throw _privateConstructorUsedError; // e.g., DOCUMENT_VERIFIED, DOCUMENT_REJECTED, ENTITY_APPROVED
  @JsonKey(name: 'document_id')
  String? get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_status')
  String? get previousStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_status')
  String? get newStatus => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationAuditLogModelCopyWith<VerificationAuditLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationAuditLogModelCopyWith<$Res> {
  factory $VerificationAuditLogModelCopyWith(VerificationAuditLogModel value,
          $Res Function(VerificationAuditLogModel) then) =
      _$VerificationAuditLogModelCopyWithImpl<$Res, VerificationAuditLogModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'audit_id') String auditId,
      @JsonKey(name: 'admin_id') String adminId,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'entity_type') String entityType,
      String action,
      @JsonKey(name: 'document_id') String? documentId,
      @JsonKey(name: 'previous_status') String? previousStatus,
      @JsonKey(name: 'new_status') String? newStatus,
      String? reason,
      String? comment,
      @TimestampConverter() DateTime timestamp});
}

/// @nodoc
class _$VerificationAuditLogModelCopyWithImpl<$Res,
        $Val extends VerificationAuditLogModel>
    implements $VerificationAuditLogModelCopyWith<$Res> {
  _$VerificationAuditLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditId = null,
    Object? adminId = null,
    Object? entityId = null,
    Object? entityType = null,
    Object? action = null,
    Object? documentId = freezed,
    Object? previousStatus = freezed,
    Object? newStatus = freezed,
    Object? reason = freezed,
    Object? comment = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      auditId: null == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      previousStatus: freezed == previousStatus
          ? _value.previousStatus
          : previousStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      newStatus: freezed == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationAuditLogModelImplCopyWith<$Res>
    implements $VerificationAuditLogModelCopyWith<$Res> {
  factory _$$VerificationAuditLogModelImplCopyWith(
          _$VerificationAuditLogModelImpl value,
          $Res Function(_$VerificationAuditLogModelImpl) then) =
      __$$VerificationAuditLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'audit_id') String auditId,
      @JsonKey(name: 'admin_id') String adminId,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'entity_type') String entityType,
      String action,
      @JsonKey(name: 'document_id') String? documentId,
      @JsonKey(name: 'previous_status') String? previousStatus,
      @JsonKey(name: 'new_status') String? newStatus,
      String? reason,
      String? comment,
      @TimestampConverter() DateTime timestamp});
}

/// @nodoc
class __$$VerificationAuditLogModelImplCopyWithImpl<$Res>
    extends _$VerificationAuditLogModelCopyWithImpl<$Res,
        _$VerificationAuditLogModelImpl>
    implements _$$VerificationAuditLogModelImplCopyWith<$Res> {
  __$$VerificationAuditLogModelImplCopyWithImpl(
      _$VerificationAuditLogModelImpl _value,
      $Res Function(_$VerificationAuditLogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditId = null,
    Object? adminId = null,
    Object? entityId = null,
    Object? entityType = null,
    Object? action = null,
    Object? documentId = freezed,
    Object? previousStatus = freezed,
    Object? newStatus = freezed,
    Object? reason = freezed,
    Object? comment = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$VerificationAuditLogModelImpl(
      auditId: null == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      previousStatus: freezed == previousStatus
          ? _value.previousStatus
          : previousStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      newStatus: freezed == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationAuditLogModelImpl implements _VerificationAuditLogModel {
  const _$VerificationAuditLogModelImpl(
      {@JsonKey(name: 'audit_id') required this.auditId,
      @JsonKey(name: 'admin_id') required this.adminId,
      @JsonKey(name: 'entity_id') required this.entityId,
      @JsonKey(name: 'entity_type') required this.entityType,
      required this.action,
      @JsonKey(name: 'document_id') this.documentId,
      @JsonKey(name: 'previous_status') this.previousStatus,
      @JsonKey(name: 'new_status') this.newStatus,
      this.reason,
      this.comment,
      @TimestampConverter() required this.timestamp});

  factory _$VerificationAuditLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationAuditLogModelImplFromJson(json);

  @override
  @JsonKey(name: 'audit_id')
  final String auditId;
  @override
  @JsonKey(name: 'admin_id')
  final String adminId;
  @override
  @JsonKey(name: 'entity_id')
  final String entityId;
  @override
  @JsonKey(name: 'entity_type')
  final String entityType;
  @override
  final String action;
// e.g., DOCUMENT_VERIFIED, DOCUMENT_REJECTED, ENTITY_APPROVED
  @override
  @JsonKey(name: 'document_id')
  final String? documentId;
  @override
  @JsonKey(name: 'previous_status')
  final String? previousStatus;
  @override
  @JsonKey(name: 'new_status')
  final String? newStatus;
  @override
  final String? reason;
  @override
  final String? comment;
  @override
  @TimestampConverter()
  final DateTime timestamp;

  @override
  String toString() {
    return 'VerificationAuditLogModel(auditId: $auditId, adminId: $adminId, entityId: $entityId, entityType: $entityType, action: $action, documentId: $documentId, previousStatus: $previousStatus, newStatus: $newStatus, reason: $reason, comment: $comment, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationAuditLogModelImpl &&
            (identical(other.auditId, auditId) || other.auditId == auditId) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.previousStatus, previousStatus) ||
                other.previousStatus == previousStatus) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      auditId,
      adminId,
      entityId,
      entityType,
      action,
      documentId,
      previousStatus,
      newStatus,
      reason,
      comment,
      timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationAuditLogModelImplCopyWith<_$VerificationAuditLogModelImpl>
      get copyWith => __$$VerificationAuditLogModelImplCopyWithImpl<
          _$VerificationAuditLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationAuditLogModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationAuditLogModel implements VerificationAuditLogModel {
  const factory _VerificationAuditLogModel(
          {@JsonKey(name: 'audit_id') required final String auditId,
          @JsonKey(name: 'admin_id') required final String adminId,
          @JsonKey(name: 'entity_id') required final String entityId,
          @JsonKey(name: 'entity_type') required final String entityType,
          required final String action,
          @JsonKey(name: 'document_id') final String? documentId,
          @JsonKey(name: 'previous_status') final String? previousStatus,
          @JsonKey(name: 'new_status') final String? newStatus,
          final String? reason,
          final String? comment,
          @TimestampConverter() required final DateTime timestamp}) =
      _$VerificationAuditLogModelImpl;

  factory _VerificationAuditLogModel.fromJson(Map<String, dynamic> json) =
      _$VerificationAuditLogModelImpl.fromJson;

  @override
  @JsonKey(name: 'audit_id')
  String get auditId;
  @override
  @JsonKey(name: 'admin_id')
  String get adminId;
  @override
  @JsonKey(name: 'entity_id')
  String get entityId;
  @override
  @JsonKey(name: 'entity_type')
  String get entityType;
  @override
  String get action;
  @override // e.g., DOCUMENT_VERIFIED, DOCUMENT_REJECTED, ENTITY_APPROVED
  @JsonKey(name: 'document_id')
  String? get documentId;
  @override
  @JsonKey(name: 'previous_status')
  String? get previousStatus;
  @override
  @JsonKey(name: 'new_status')
  String? get newStatus;
  @override
  String? get reason;
  @override
  String? get comment;
  @override
  @TimestampConverter()
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$VerificationAuditLogModelImplCopyWith<_$VerificationAuditLogModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
