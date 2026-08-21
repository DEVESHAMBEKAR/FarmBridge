// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logistics_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogisticsJobModel _$LogisticsJobModelFromJson(Map<String, dynamic> json) {
  return _LogisticsJobModel.fromJson(json);
}

/// @nodoc
mixin _$LogisticsJobModel {
  @JsonKey(name: 'job_id')
  String get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deal_id')
  String get dealId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transporter_id')
  String? get transporterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_location')
  String get pickupLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'drop_location')
  String get dropLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_latitude')
  double? get deliveryLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_longitude')
  double? get deliveryLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_km')
  double get distanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_vehicle_type')
  String get requiredVehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_pickup_time')
  @TimestampNonNullConverter()
  DateTime get expectedPickupTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_delivery_time')
  @TimestampNonNullConverter()
  DateTime get expectedDeliveryTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'offered_freight_amount')
  double get offeredFreightAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreed_freight_amount')
  double? get agreedFreightAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_trip_id')
  String? get activeTripId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_otp')
  String? get pickupOtp => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_otp')
  String? get deliveryOtp => throw _privateConstructorUsedError;
  @JsonKey(name: 'proof_of_delivery_url')
  String? get proofOfDeliveryUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogisticsJobModelCopyWith<LogisticsJobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogisticsJobModelCopyWith<$Res> {
  factory $LogisticsJobModelCopyWith(
          LogisticsJobModel value, $Res Function(LogisticsJobModel) then) =
      _$LogisticsJobModelCopyWithImpl<$Res, LogisticsJobModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'deal_id') String dealId,
      @JsonKey(name: 'transporter_id') String? transporterId,
      @JsonKey(name: 'pickup_location') String pickupLocation,
      @JsonKey(name: 'drop_location') String dropLocation,
      @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'required_vehicle_type') String requiredVehicleType,
      @JsonKey(name: 'expected_pickup_time')
      @TimestampNonNullConverter()
      DateTime expectedPickupTime,
      @JsonKey(name: 'expected_delivery_time')
      @TimestampNonNullConverter()
      DateTime expectedDeliveryTime,
      String status,
      @JsonKey(name: 'offered_freight_amount') double offeredFreightAmount,
      @JsonKey(name: 'agreed_freight_amount') double? agreedFreightAmount,
      @JsonKey(name: 'active_trip_id') String? activeTripId,
      @JsonKey(name: 'pickup_otp') String? pickupOtp,
      @JsonKey(name: 'delivery_otp') String? deliveryOtp,
      @JsonKey(name: 'proof_of_delivery_url') String? proofOfDeliveryUrl,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$LogisticsJobModelCopyWithImpl<$Res, $Val extends LogisticsJobModel>
    implements $LogisticsJobModelCopyWith<$Res> {
  _$LogisticsJobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? dealId = null,
    Object? transporterId = freezed,
    Object? pickupLocation = null,
    Object? dropLocation = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? distanceKm = null,
    Object? requiredVehicleType = null,
    Object? expectedPickupTime = null,
    Object? expectedDeliveryTime = null,
    Object? status = null,
    Object? offeredFreightAmount = null,
    Object? agreedFreightAmount = freezed,
    Object? activeTripId = freezed,
    Object? pickupOtp = freezed,
    Object? deliveryOtp = freezed,
    Object? proofOfDeliveryUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      dealId: null == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      transporterId: freezed == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropLocation: null == dropLocation
          ? _value.dropLocation
          : dropLocation // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      requiredVehicleType: null == requiredVehicleType
          ? _value.requiredVehicleType
          : requiredVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      expectedPickupTime: null == expectedPickupTime
          ? _value.expectedPickupTime
          : expectedPickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryTime: null == expectedDeliveryTime
          ? _value.expectedDeliveryTime
          : expectedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      offeredFreightAmount: null == offeredFreightAmount
          ? _value.offeredFreightAmount
          : offeredFreightAmount // ignore: cast_nullable_to_non_nullable
              as double,
      agreedFreightAmount: freezed == agreedFreightAmount
          ? _value.agreedFreightAmount
          : agreedFreightAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      activeTripId: freezed == activeTripId
          ? _value.activeTripId
          : activeTripId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupOtp: freezed == pickupOtp
          ? _value.pickupOtp
          : pickupOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOtp: freezed == deliveryOtp
          ? _value.deliveryOtp
          : deliveryOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryUrl: freezed == proofOfDeliveryUrl
          ? _value.proofOfDeliveryUrl
          : proofOfDeliveryUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$LogisticsJobModelImplCopyWith<$Res>
    implements $LogisticsJobModelCopyWith<$Res> {
  factory _$$LogisticsJobModelImplCopyWith(_$LogisticsJobModelImpl value,
          $Res Function(_$LogisticsJobModelImpl) then) =
      __$$LogisticsJobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'deal_id') String dealId,
      @JsonKey(name: 'transporter_id') String? transporterId,
      @JsonKey(name: 'pickup_location') String pickupLocation,
      @JsonKey(name: 'drop_location') String dropLocation,
      @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'required_vehicle_type') String requiredVehicleType,
      @JsonKey(name: 'expected_pickup_time')
      @TimestampNonNullConverter()
      DateTime expectedPickupTime,
      @JsonKey(name: 'expected_delivery_time')
      @TimestampNonNullConverter()
      DateTime expectedDeliveryTime,
      String status,
      @JsonKey(name: 'offered_freight_amount') double offeredFreightAmount,
      @JsonKey(name: 'agreed_freight_amount') double? agreedFreightAmount,
      @JsonKey(name: 'active_trip_id') String? activeTripId,
      @JsonKey(name: 'pickup_otp') String? pickupOtp,
      @JsonKey(name: 'delivery_otp') String? deliveryOtp,
      @JsonKey(name: 'proof_of_delivery_url') String? proofOfDeliveryUrl,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$LogisticsJobModelImplCopyWithImpl<$Res>
    extends _$LogisticsJobModelCopyWithImpl<$Res, _$LogisticsJobModelImpl>
    implements _$$LogisticsJobModelImplCopyWith<$Res> {
  __$$LogisticsJobModelImplCopyWithImpl(_$LogisticsJobModelImpl _value,
      $Res Function(_$LogisticsJobModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? dealId = null,
    Object? transporterId = freezed,
    Object? pickupLocation = null,
    Object? dropLocation = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? distanceKm = null,
    Object? requiredVehicleType = null,
    Object? expectedPickupTime = null,
    Object? expectedDeliveryTime = null,
    Object? status = null,
    Object? offeredFreightAmount = null,
    Object? agreedFreightAmount = freezed,
    Object? activeTripId = freezed,
    Object? pickupOtp = freezed,
    Object? deliveryOtp = freezed,
    Object? proofOfDeliveryUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$LogisticsJobModelImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      dealId: null == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      transporterId: freezed == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropLocation: null == dropLocation
          ? _value.dropLocation
          : dropLocation // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      requiredVehicleType: null == requiredVehicleType
          ? _value.requiredVehicleType
          : requiredVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      expectedPickupTime: null == expectedPickupTime
          ? _value.expectedPickupTime
          : expectedPickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryTime: null == expectedDeliveryTime
          ? _value.expectedDeliveryTime
          : expectedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      offeredFreightAmount: null == offeredFreightAmount
          ? _value.offeredFreightAmount
          : offeredFreightAmount // ignore: cast_nullable_to_non_nullable
              as double,
      agreedFreightAmount: freezed == agreedFreightAmount
          ? _value.agreedFreightAmount
          : agreedFreightAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      activeTripId: freezed == activeTripId
          ? _value.activeTripId
          : activeTripId // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupOtp: freezed == pickupOtp
          ? _value.pickupOtp
          : pickupOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOtp: freezed == deliveryOtp
          ? _value.deliveryOtp
          : deliveryOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfDeliveryUrl: freezed == proofOfDeliveryUrl
          ? _value.proofOfDeliveryUrl
          : proofOfDeliveryUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$LogisticsJobModelImpl implements _LogisticsJobModel {
  const _$LogisticsJobModelImpl(
      {@JsonKey(name: 'job_id') required this.jobId,
      @JsonKey(name: 'deal_id') required this.dealId,
      @JsonKey(name: 'transporter_id') this.transporterId,
      @JsonKey(name: 'pickup_location') required this.pickupLocation,
      @JsonKey(name: 'drop_location') required this.dropLocation,
      @JsonKey(name: 'delivery_latitude') this.deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') this.deliveryLongitude,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'required_vehicle_type') required this.requiredVehicleType,
      @JsonKey(name: 'expected_pickup_time')
      @TimestampNonNullConverter()
      required this.expectedPickupTime,
      @JsonKey(name: 'expected_delivery_time')
      @TimestampNonNullConverter()
      required this.expectedDeliveryTime,
      this.status = 'PENDING',
      @JsonKey(name: 'offered_freight_amount')
      required this.offeredFreightAmount,
      @JsonKey(name: 'agreed_freight_amount') this.agreedFreightAmount,
      @JsonKey(name: 'active_trip_id') this.activeTripId,
      @JsonKey(name: 'pickup_otp') this.pickupOtp,
      @JsonKey(name: 'delivery_otp') this.deliveryOtp,
      @JsonKey(name: 'proof_of_delivery_url') this.proofOfDeliveryUrl,
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$LogisticsJobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogisticsJobModelImplFromJson(json);

  @override
  @JsonKey(name: 'job_id')
  final String jobId;
  @override
  @JsonKey(name: 'deal_id')
  final String dealId;
  @override
  @JsonKey(name: 'transporter_id')
  final String? transporterId;
  @override
  @JsonKey(name: 'pickup_location')
  final String pickupLocation;
  @override
  @JsonKey(name: 'drop_location')
  final String dropLocation;
  @override
  @JsonKey(name: 'delivery_latitude')
  final double? deliveryLatitude;
  @override
  @JsonKey(name: 'delivery_longitude')
  final double? deliveryLongitude;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'required_vehicle_type')
  final String requiredVehicleType;
  @override
  @JsonKey(name: 'expected_pickup_time')
  @TimestampNonNullConverter()
  final DateTime expectedPickupTime;
  @override
  @JsonKey(name: 'expected_delivery_time')
  @TimestampNonNullConverter()
  final DateTime expectedDeliveryTime;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'offered_freight_amount')
  final double offeredFreightAmount;
  @override
  @JsonKey(name: 'agreed_freight_amount')
  final double? agreedFreightAmount;
  @override
  @JsonKey(name: 'active_trip_id')
  final String? activeTripId;
  @override
  @JsonKey(name: 'pickup_otp')
  final String? pickupOtp;
  @override
  @JsonKey(name: 'delivery_otp')
  final String? deliveryOtp;
  @override
  @JsonKey(name: 'proof_of_delivery_url')
  final String? proofOfDeliveryUrl;
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
    return 'LogisticsJobModel(jobId: $jobId, dealId: $dealId, transporterId: $transporterId, pickupLocation: $pickupLocation, dropLocation: $dropLocation, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, distanceKm: $distanceKm, requiredVehicleType: $requiredVehicleType, expectedPickupTime: $expectedPickupTime, expectedDeliveryTime: $expectedDeliveryTime, status: $status, offeredFreightAmount: $offeredFreightAmount, agreedFreightAmount: $agreedFreightAmount, activeTripId: $activeTripId, pickupOtp: $pickupOtp, deliveryOtp: $deliveryOtp, proofOfDeliveryUrl: $proofOfDeliveryUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogisticsJobModelImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.dealId, dealId) || other.dealId == dealId) &&
            (identical(other.transporterId, transporterId) ||
                other.transporterId == transporterId) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropLocation, dropLocation) ||
                other.dropLocation == dropLocation) &&
            (identical(other.deliveryLatitude, deliveryLatitude) ||
                other.deliveryLatitude == deliveryLatitude) &&
            (identical(other.deliveryLongitude, deliveryLongitude) ||
                other.deliveryLongitude == deliveryLongitude) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.requiredVehicleType, requiredVehicleType) ||
                other.requiredVehicleType == requiredVehicleType) &&
            (identical(other.expectedPickupTime, expectedPickupTime) ||
                other.expectedPickupTime == expectedPickupTime) &&
            (identical(other.expectedDeliveryTime, expectedDeliveryTime) ||
                other.expectedDeliveryTime == expectedDeliveryTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.offeredFreightAmount, offeredFreightAmount) ||
                other.offeredFreightAmount == offeredFreightAmount) &&
            (identical(other.agreedFreightAmount, agreedFreightAmount) ||
                other.agreedFreightAmount == agreedFreightAmount) &&
            (identical(other.activeTripId, activeTripId) ||
                other.activeTripId == activeTripId) &&
            (identical(other.pickupOtp, pickupOtp) ||
                other.pickupOtp == pickupOtp) &&
            (identical(other.deliveryOtp, deliveryOtp) ||
                other.deliveryOtp == deliveryOtp) &&
            (identical(other.proofOfDeliveryUrl, proofOfDeliveryUrl) ||
                other.proofOfDeliveryUrl == proofOfDeliveryUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        jobId,
        dealId,
        transporterId,
        pickupLocation,
        dropLocation,
        deliveryLatitude,
        deliveryLongitude,
        distanceKm,
        requiredVehicleType,
        expectedPickupTime,
        expectedDeliveryTime,
        status,
        offeredFreightAmount,
        agreedFreightAmount,
        activeTripId,
        pickupOtp,
        deliveryOtp,
        proofOfDeliveryUrl,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogisticsJobModelImplCopyWith<_$LogisticsJobModelImpl> get copyWith =>
      __$$LogisticsJobModelImplCopyWithImpl<_$LogisticsJobModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogisticsJobModelImplToJson(
      this,
    );
  }
}

abstract class _LogisticsJobModel implements LogisticsJobModel {
  const factory _LogisticsJobModel(
      {@JsonKey(name: 'job_id') required final String jobId,
      @JsonKey(name: 'deal_id') required final String dealId,
      @JsonKey(name: 'transporter_id') final String? transporterId,
      @JsonKey(name: 'pickup_location') required final String pickupLocation,
      @JsonKey(name: 'drop_location') required final String dropLocation,
      @JsonKey(name: 'delivery_latitude') final double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') final double? deliveryLongitude,
      @JsonKey(name: 'distance_km') required final double distanceKm,
      @JsonKey(name: 'required_vehicle_type')
      required final String requiredVehicleType,
      @JsonKey(name: 'expected_pickup_time')
      @TimestampNonNullConverter()
      required final DateTime expectedPickupTime,
      @JsonKey(name: 'expected_delivery_time')
      @TimestampNonNullConverter()
      required final DateTime expectedDeliveryTime,
      final String status,
      @JsonKey(name: 'offered_freight_amount')
      required final double offeredFreightAmount,
      @JsonKey(name: 'agreed_freight_amount') final double? agreedFreightAmount,
      @JsonKey(name: 'active_trip_id') final String? activeTripId,
      @JsonKey(name: 'pickup_otp') final String? pickupOtp,
      @JsonKey(name: 'delivery_otp') final String? deliveryOtp,
      @JsonKey(name: 'proof_of_delivery_url') final String? proofOfDeliveryUrl,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$LogisticsJobModelImpl;

  factory _LogisticsJobModel.fromJson(Map<String, dynamic> json) =
      _$LogisticsJobModelImpl.fromJson;

  @override
  @JsonKey(name: 'job_id')
  String get jobId;
  @override
  @JsonKey(name: 'deal_id')
  String get dealId;
  @override
  @JsonKey(name: 'transporter_id')
  String? get transporterId;
  @override
  @JsonKey(name: 'pickup_location')
  String get pickupLocation;
  @override
  @JsonKey(name: 'drop_location')
  String get dropLocation;
  @override
  @JsonKey(name: 'delivery_latitude')
  double? get deliveryLatitude;
  @override
  @JsonKey(name: 'delivery_longitude')
  double? get deliveryLongitude;
  @override
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @override
  @JsonKey(name: 'required_vehicle_type')
  String get requiredVehicleType;
  @override
  @JsonKey(name: 'expected_pickup_time')
  @TimestampNonNullConverter()
  DateTime get expectedPickupTime;
  @override
  @JsonKey(name: 'expected_delivery_time')
  @TimestampNonNullConverter()
  DateTime get expectedDeliveryTime;
  @override
  String get status;
  @override
  @JsonKey(name: 'offered_freight_amount')
  double get offeredFreightAmount;
  @override
  @JsonKey(name: 'agreed_freight_amount')
  double? get agreedFreightAmount;
  @override
  @JsonKey(name: 'active_trip_id')
  String? get activeTripId;
  @override
  @JsonKey(name: 'pickup_otp')
  String? get pickupOtp;
  @override
  @JsonKey(name: 'delivery_otp')
  String? get deliveryOtp;
  @override
  @JsonKey(name: 'proof_of_delivery_url')
  String? get proofOfDeliveryUrl;
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
  _$$LogisticsJobModelImplCopyWith<_$LogisticsJobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
