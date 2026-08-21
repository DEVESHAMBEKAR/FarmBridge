// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationDocumentModel _$VerificationDocumentModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationDocumentModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationDocumentModel {
  @JsonKey(name: 'document_id')
  String get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_type')
  String get entityType =>
      throw _privateConstructorUsedError; // farmer, logistics, dealer, etc.
  @JsonKey(name: 'document_type')
  String get documentType =>
      throw _privateConstructorUsedError; // identity_proof, driving_license, etc.
  @JsonKey(name: 'document_name')
  String get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_path')
  String get storagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_url')
  String get downloadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_number_masked')
  String? get documentNumberMasked => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // SUBMITTED, UNDER_REVIEW, VERIFIED, REJECTED, EXPIRED, RESUBMISSION_REQUIRED
  @JsonKey(name: 'uploaded_at')
  @TimestampConverter()
  DateTime? get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewed_at')
  @TimestampConverter()
  DateTime? get reviewedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewed_by')
  String? get reviewedBy => throw _privateConstructorUsedError; // admin uid
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_comment')
  String? get adminComment => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_required')
  bool get isRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationDocumentModelCopyWith<VerificationDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationDocumentModelCopyWith<$Res> {
  factory $VerificationDocumentModelCopyWith(VerificationDocumentModel value,
          $Res Function(VerificationDocumentModel) then) =
      _$VerificationDocumentModelCopyWithImpl<$Res, VerificationDocumentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'document_id') String documentId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entity_type') String entityType,
      @JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'storage_path') String storagePath,
      @JsonKey(name: 'download_url') String downloadUrl,
      @JsonKey(name: 'document_number_masked') String? documentNumberMasked,
      String status,
      @JsonKey(name: 'uploaded_at') @TimestampConverter() DateTime? uploadedAt,
      @JsonKey(name: 'reviewed_at') @TimestampConverter() DateTime? reviewedAt,
      @JsonKey(name: 'reviewed_by') String? reviewedBy,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'admin_comment') String? adminComment,
      int version,
      @JsonKey(name: 'is_required') bool isRequired});
}

/// @nodoc
class _$VerificationDocumentModelCopyWithImpl<$Res,
        $Val extends VerificationDocumentModel>
    implements $VerificationDocumentModelCopyWith<$Res> {
  _$VerificationDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? userId = null,
    Object? entityType = null,
    Object? documentType = null,
    Object? documentName = null,
    Object? storagePath = null,
    Object? downloadUrl = null,
    Object? documentNumberMasked = freezed,
    Object? status = null,
    Object? uploadedAt = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? rejectionReason = freezed,
    Object? adminComment = freezed,
    Object? version = null,
    Object? isRequired = null,
  }) {
    return _then(_value.copyWith(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      documentNumberMasked: freezed == documentNumberMasked
          ? _value.documentNumberMasked
          : documentNumberMasked // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedBy: freezed == reviewedBy
          ? _value.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      adminComment: freezed == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationDocumentModelImplCopyWith<$Res>
    implements $VerificationDocumentModelCopyWith<$Res> {
  factory _$$VerificationDocumentModelImplCopyWith(
          _$VerificationDocumentModelImpl value,
          $Res Function(_$VerificationDocumentModelImpl) then) =
      __$$VerificationDocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'document_id') String documentId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entity_type') String entityType,
      @JsonKey(name: 'document_type') String documentType,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'storage_path') String storagePath,
      @JsonKey(name: 'download_url') String downloadUrl,
      @JsonKey(name: 'document_number_masked') String? documentNumberMasked,
      String status,
      @JsonKey(name: 'uploaded_at') @TimestampConverter() DateTime? uploadedAt,
      @JsonKey(name: 'reviewed_at') @TimestampConverter() DateTime? reviewedAt,
      @JsonKey(name: 'reviewed_by') String? reviewedBy,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'admin_comment') String? adminComment,
      int version,
      @JsonKey(name: 'is_required') bool isRequired});
}

/// @nodoc
class __$$VerificationDocumentModelImplCopyWithImpl<$Res>
    extends _$VerificationDocumentModelCopyWithImpl<$Res,
        _$VerificationDocumentModelImpl>
    implements _$$VerificationDocumentModelImplCopyWith<$Res> {
  __$$VerificationDocumentModelImplCopyWithImpl(
      _$VerificationDocumentModelImpl _value,
      $Res Function(_$VerificationDocumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? userId = null,
    Object? entityType = null,
    Object? documentType = null,
    Object? documentName = null,
    Object? storagePath = null,
    Object? downloadUrl = null,
    Object? documentNumberMasked = freezed,
    Object? status = null,
    Object? uploadedAt = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? rejectionReason = freezed,
    Object? adminComment = freezed,
    Object? version = null,
    Object? isRequired = null,
  }) {
    return _then(_$VerificationDocumentModelImpl(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      documentNumberMasked: freezed == documentNumberMasked
          ? _value.documentNumberMasked
          : documentNumberMasked // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedBy: freezed == reviewedBy
          ? _value.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      adminComment: freezed == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationDocumentModelImpl implements _VerificationDocumentModel {
  const _$VerificationDocumentModelImpl(
      {@JsonKey(name: 'document_id') required this.documentId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'entity_type') required this.entityType,
      @JsonKey(name: 'document_type') required this.documentType,
      @JsonKey(name: 'document_name') required this.documentName,
      @JsonKey(name: 'storage_path') required this.storagePath,
      @JsonKey(name: 'download_url') required this.downloadUrl,
      @JsonKey(name: 'document_number_masked') this.documentNumberMasked,
      this.status = 'SUBMITTED',
      @JsonKey(name: 'uploaded_at') @TimestampConverter() this.uploadedAt,
      @JsonKey(name: 'reviewed_at') @TimestampConverter() this.reviewedAt,
      @JsonKey(name: 'reviewed_by') this.reviewedBy,
      @JsonKey(name: 'rejection_reason') this.rejectionReason,
      @JsonKey(name: 'admin_comment') this.adminComment,
      this.version = 1,
      @JsonKey(name: 'is_required') this.isRequired = true});

  factory _$VerificationDocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationDocumentModelImplFromJson(json);

  @override
  @JsonKey(name: 'document_id')
  final String documentId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'entity_type')
  final String entityType;
// farmer, logistics, dealer, etc.
  @override
  @JsonKey(name: 'document_type')
  final String documentType;
// identity_proof, driving_license, etc.
  @override
  @JsonKey(name: 'document_name')
  final String documentName;
  @override
  @JsonKey(name: 'storage_path')
  final String storagePath;
  @override
  @JsonKey(name: 'download_url')
  final String downloadUrl;
  @override
  @JsonKey(name: 'document_number_masked')
  final String? documentNumberMasked;
  @override
  @JsonKey()
  final String status;
// SUBMITTED, UNDER_REVIEW, VERIFIED, REJECTED, EXPIRED, RESUBMISSION_REQUIRED
  @override
  @JsonKey(name: 'uploaded_at')
  @TimestampConverter()
  final DateTime? uploadedAt;
  @override
  @JsonKey(name: 'reviewed_at')
  @TimestampConverter()
  final DateTime? reviewedAt;
  @override
  @JsonKey(name: 'reviewed_by')
  final String? reviewedBy;
// admin uid
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  @JsonKey(name: 'admin_comment')
  final String? adminComment;
  @override
  @JsonKey()
  final int version;
  @override
  @JsonKey(name: 'is_required')
  final bool isRequired;

  @override
  String toString() {
    return 'VerificationDocumentModel(documentId: $documentId, userId: $userId, entityType: $entityType, documentType: $documentType, documentName: $documentName, storagePath: $storagePath, downloadUrl: $downloadUrl, documentNumberMasked: $documentNumberMasked, status: $status, uploadedAt: $uploadedAt, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, rejectionReason: $rejectionReason, adminComment: $adminComment, version: $version, isRequired: $isRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationDocumentModelImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.documentNumberMasked, documentNumberMasked) ||
                other.documentNumberMasked == documentNumberMasked) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.adminComment, adminComment) ||
                other.adminComment == adminComment) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentId,
      userId,
      entityType,
      documentType,
      documentName,
      storagePath,
      downloadUrl,
      documentNumberMasked,
      status,
      uploadedAt,
      reviewedAt,
      reviewedBy,
      rejectionReason,
      adminComment,
      version,
      isRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationDocumentModelImplCopyWith<_$VerificationDocumentModelImpl>
      get copyWith => __$$VerificationDocumentModelImplCopyWithImpl<
          _$VerificationDocumentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationDocumentModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationDocumentModel implements VerificationDocumentModel {
  const factory _VerificationDocumentModel(
          {@JsonKey(name: 'document_id') required final String documentId,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'entity_type') required final String entityType,
          @JsonKey(name: 'document_type') required final String documentType,
          @JsonKey(name: 'document_name') required final String documentName,
          @JsonKey(name: 'storage_path') required final String storagePath,
          @JsonKey(name: 'download_url') required final String downloadUrl,
          @JsonKey(name: 'document_number_masked')
          final String? documentNumberMasked,
          final String status,
          @JsonKey(name: 'uploaded_at')
          @TimestampConverter()
          final DateTime? uploadedAt,
          @JsonKey(name: 'reviewed_at')
          @TimestampConverter()
          final DateTime? reviewedAt,
          @JsonKey(name: 'reviewed_by') final String? reviewedBy,
          @JsonKey(name: 'rejection_reason') final String? rejectionReason,
          @JsonKey(name: 'admin_comment') final String? adminComment,
          final int version,
          @JsonKey(name: 'is_required') final bool isRequired}) =
      _$VerificationDocumentModelImpl;

  factory _VerificationDocumentModel.fromJson(Map<String, dynamic> json) =
      _$VerificationDocumentModelImpl.fromJson;

  @override
  @JsonKey(name: 'document_id')
  String get documentId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'entity_type')
  String get entityType;
  @override // farmer, logistics, dealer, etc.
  @JsonKey(name: 'document_type')
  String get documentType;
  @override // identity_proof, driving_license, etc.
  @JsonKey(name: 'document_name')
  String get documentName;
  @override
  @JsonKey(name: 'storage_path')
  String get storagePath;
  @override
  @JsonKey(name: 'download_url')
  String get downloadUrl;
  @override
  @JsonKey(name: 'document_number_masked')
  String? get documentNumberMasked;
  @override
  String get status;
  @override // SUBMITTED, UNDER_REVIEW, VERIFIED, REJECTED, EXPIRED, RESUBMISSION_REQUIRED
  @JsonKey(name: 'uploaded_at')
  @TimestampConverter()
  DateTime? get uploadedAt;
  @override
  @JsonKey(name: 'reviewed_at')
  @TimestampConverter()
  DateTime? get reviewedAt;
  @override
  @JsonKey(name: 'reviewed_by')
  String? get reviewedBy;
  @override // admin uid
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  @JsonKey(name: 'admin_comment')
  String? get adminComment;
  @override
  int get version;
  @override
  @JsonKey(name: 'is_required')
  bool get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$VerificationDocumentModelImplCopyWith<_$VerificationDocumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
