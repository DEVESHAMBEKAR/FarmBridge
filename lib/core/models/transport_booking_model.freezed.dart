// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransportBookingModel _$TransportBookingModelFromJson(
    Map<String, dynamic> json) {
  return _TransportBookingModel.fromJson(json);
}

/// @nodoc
mixin _$TransportBookingModel {
  @JsonKey(name: 'booking_id')
  String get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transport_request_id')
  String get transportRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_type')
  String get providerType =>
      throw _privateConstructorUsedError; // FARM_BRIDGE or THIRD_PARTY
  @JsonKey(name: 'partner_id')
  String? get partnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_id')
  String? get providerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_booking_id')
  String? get externalBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_phone')
  String? get driverPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_url')
  String? get trackingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreed_price')
  double? get agreedPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportBookingModelCopyWith<TransportBookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportBookingModelCopyWith<$Res> {
  factory $TransportBookingModelCopyWith(TransportBookingModel value,
          $Res Function(TransportBookingModel) then) =
      _$TransportBookingModelCopyWithImpl<$Res, TransportBookingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'transport_request_id') String transportRequestId,
      @JsonKey(name: 'provider_type') String providerType,
      @JsonKey(name: 'partner_id') String? partnerId,
      @JsonKey(name: 'provider_id') String? providerId,
      @JsonKey(name: 'external_booking_id') String? externalBookingId,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_phone') String? driverPhone,
      @JsonKey(name: 'vehicle_number') String? vehicleNumber,
      @JsonKey(name: 'tracking_url') String? trackingUrl,
      @JsonKey(name: 'agreed_price') double? agreedPrice,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$TransportBookingModelCopyWithImpl<$Res,
        $Val extends TransportBookingModel>
    implements $TransportBookingModelCopyWith<$Res> {
  _$TransportBookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? transportRequestId = null,
    Object? providerType = null,
    Object? partnerId = freezed,
    Object? providerId = freezed,
    Object? externalBookingId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? vehicleNumber = freezed,
    Object? trackingUrl = freezed,
    Object? agreedPrice = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      transportRequestId: null == transportRequestId
          ? _value.transportRequestId
          : transportRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalBookingId: freezed == externalBookingId
          ? _value.externalBookingId
          : externalBookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingUrl: freezed == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agreedPrice: freezed == agreedPrice
          ? _value.agreedPrice
          : agreedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransportBookingModelImplCopyWith<$Res>
    implements $TransportBookingModelCopyWith<$Res> {
  factory _$$TransportBookingModelImplCopyWith(
          _$TransportBookingModelImpl value,
          $Res Function(_$TransportBookingModelImpl) then) =
      __$$TransportBookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'transport_request_id') String transportRequestId,
      @JsonKey(name: 'provider_type') String providerType,
      @JsonKey(name: 'partner_id') String? partnerId,
      @JsonKey(name: 'provider_id') String? providerId,
      @JsonKey(name: 'external_booking_id') String? externalBookingId,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_phone') String? driverPhone,
      @JsonKey(name: 'vehicle_number') String? vehicleNumber,
      @JsonKey(name: 'tracking_url') String? trackingUrl,
      @JsonKey(name: 'agreed_price') double? agreedPrice,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$TransportBookingModelImplCopyWithImpl<$Res>
    extends _$TransportBookingModelCopyWithImpl<$Res,
        _$TransportBookingModelImpl>
    implements _$$TransportBookingModelImplCopyWith<$Res> {
  __$$TransportBookingModelImplCopyWithImpl(_$TransportBookingModelImpl _value,
      $Res Function(_$TransportBookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? transportRequestId = null,
    Object? providerType = null,
    Object? partnerId = freezed,
    Object? providerId = freezed,
    Object? externalBookingId = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? vehicleNumber = freezed,
    Object? trackingUrl = freezed,
    Object? agreedPrice = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransportBookingModelImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      transportRequestId: null == transportRequestId
          ? _value.transportRequestId
          : transportRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalBookingId: freezed == externalBookingId
          ? _value.externalBookingId
          : externalBookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingUrl: freezed == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      agreedPrice: freezed == agreedPrice
          ? _value.agreedPrice
          : agreedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransportBookingModelImpl implements _TransportBookingModel {
  const _$TransportBookingModelImpl(
      {@JsonKey(name: 'booking_id') required this.bookingId,
      @JsonKey(name: 'transport_request_id') required this.transportRequestId,
      @JsonKey(name: 'provider_type') required this.providerType,
      @JsonKey(name: 'partner_id') this.partnerId,
      @JsonKey(name: 'provider_id') this.providerId,
      @JsonKey(name: 'external_booking_id') this.externalBookingId,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'driver_phone') this.driverPhone,
      @JsonKey(name: 'vehicle_number') this.vehicleNumber,
      @JsonKey(name: 'tracking_url') this.trackingUrl,
      @JsonKey(name: 'agreed_price') this.agreedPrice,
      this.status = 'ASSIGNED',
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$TransportBookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransportBookingModelImplFromJson(json);

  @override
  @JsonKey(name: 'booking_id')
  final String bookingId;
  @override
  @JsonKey(name: 'transport_request_id')
  final String transportRequestId;
  @override
  @JsonKey(name: 'provider_type')
  final String providerType;
// FARM_BRIDGE or THIRD_PARTY
  @override
  @JsonKey(name: 'partner_id')
  final String? partnerId;
  @override
  @JsonKey(name: 'provider_id')
  final String? providerId;
  @override
  @JsonKey(name: 'external_booking_id')
  final String? externalBookingId;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'driver_phone')
  final String? driverPhone;
  @override
  @JsonKey(name: 'vehicle_number')
  final String? vehicleNumber;
  @override
  @JsonKey(name: 'tracking_url')
  final String? trackingUrl;
  @override
  @JsonKey(name: 'agreed_price')
  final double? agreedPrice;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TransportBookingModel(bookingId: $bookingId, transportRequestId: $transportRequestId, providerType: $providerType, partnerId: $partnerId, providerId: $providerId, externalBookingId: $externalBookingId, driverName: $driverName, driverPhone: $driverPhone, vehicleNumber: $vehicleNumber, trackingUrl: $trackingUrl, agreedPrice: $agreedPrice, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransportBookingModelImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.transportRequestId, transportRequestId) ||
                other.transportRequestId == transportRequestId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.externalBookingId, externalBookingId) ||
                other.externalBookingId == externalBookingId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl) &&
            (identical(other.agreedPrice, agreedPrice) ||
                other.agreedPrice == agreedPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      transportRequestId,
      providerType,
      partnerId,
      providerId,
      externalBookingId,
      driverName,
      driverPhone,
      vehicleNumber,
      trackingUrl,
      agreedPrice,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransportBookingModelImplCopyWith<_$TransportBookingModelImpl>
      get copyWith => __$$TransportBookingModelImplCopyWithImpl<
          _$TransportBookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransportBookingModelImplToJson(
      this,
    );
  }
}

abstract class _TransportBookingModel implements TransportBookingModel {
  const factory _TransportBookingModel(
      {@JsonKey(name: 'booking_id') required final String bookingId,
      @JsonKey(name: 'transport_request_id')
      required final String transportRequestId,
      @JsonKey(name: 'provider_type') required final String providerType,
      @JsonKey(name: 'partner_id') final String? partnerId,
      @JsonKey(name: 'provider_id') final String? providerId,
      @JsonKey(name: 'external_booking_id') final String? externalBookingId,
      @JsonKey(name: 'driver_name') final String? driverName,
      @JsonKey(name: 'driver_phone') final String? driverPhone,
      @JsonKey(name: 'vehicle_number') final String? vehicleNumber,
      @JsonKey(name: 'tracking_url') final String? trackingUrl,
      @JsonKey(name: 'agreed_price') final double? agreedPrice,
      final String status,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$TransportBookingModelImpl;

  factory _TransportBookingModel.fromJson(Map<String, dynamic> json) =
      _$TransportBookingModelImpl.fromJson;

  @override
  @JsonKey(name: 'booking_id')
  String get bookingId;
  @override
  @JsonKey(name: 'transport_request_id')
  String get transportRequestId;
  @override
  @JsonKey(name: 'provider_type')
  String get providerType;
  @override // FARM_BRIDGE or THIRD_PARTY
  @JsonKey(name: 'partner_id')
  String? get partnerId;
  @override
  @JsonKey(name: 'provider_id')
  String? get providerId;
  @override
  @JsonKey(name: 'external_booking_id')
  String? get externalBookingId;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'driver_phone')
  String? get driverPhone;
  @override
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber;
  @override
  @JsonKey(name: 'tracking_url')
  String? get trackingUrl;
  @override
  @JsonKey(name: 'agreed_price')
  double? get agreedPrice;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TransportBookingModelImplCopyWith<_$TransportBookingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
