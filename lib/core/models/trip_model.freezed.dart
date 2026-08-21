// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripModel _$TripModelFromJson(Map<String, dynamic> json) {
  return _TripModel.fromJson(json);
}

/// @nodoc
mixin _$TripModel {
  @JsonKey(name: 'trip_id')
  String get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  String get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transporter_id')
  String get transporterId =>
      throw _privateConstructorUsedError; // Live Location
  @JsonKey(name: 'current_latitude')
  double? get currentLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_longitude')
  double? get currentLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'heading')
  double? get heading =>
      throw _privateConstructorUsedError; // Status: 'EN_ROUTE_TO_PICKUP', 'AT_PICKUP', 'EN_ROUTE_TO_DELIVERY', 'DELIVERED', 'COMPLETED'
  String get status => throw _privateConstructorUsedError; // ETA information
  @JsonKey(name: 'estimated_arrival_time')
  @TimestampConverter()
  DateTime? get estimatedArrivalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_remaining_km')
  double? get distanceRemainingKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  @TimestampConverter()
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_up_at')
  @TimestampConverter()
  DateTime? get pickedUpAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripModelCopyWith<TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) then) =
      _$TripModelCopyWithImpl<$Res, TripModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'trip_id') String tripId,
      @JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'transporter_id') String transporterId,
      @JsonKey(name: 'current_latitude') double? currentLatitude,
      @JsonKey(name: 'current_longitude') double? currentLongitude,
      @JsonKey(name: 'heading') double? heading,
      String status,
      @JsonKey(name: 'estimated_arrival_time')
      @TimestampConverter()
      DateTime? estimatedArrivalTime,
      @JsonKey(name: 'distance_remaining_km') double? distanceRemainingKm,
      @JsonKey(name: 'started_at') @TimestampConverter() DateTime? startedAt,
      @JsonKey(name: 'picked_up_at') @TimestampConverter() DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      DateTime? deliveredAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res, $Val extends TripModel>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? jobId = null,
    Object? transporterId = null,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? heading = freezed,
    Object? status = null,
    Object? estimatedArrivalTime = freezed,
    Object? distanceRemainingKm = freezed,
    Object? startedAt = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      transporterId: null == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String,
      currentLatitude: freezed == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedArrivalTime: freezed == estimatedArrivalTime
          ? _value.estimatedArrivalTime
          : estimatedArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distanceRemainingKm: freezed == distanceRemainingKm
          ? _value.distanceRemainingKm
          : distanceRemainingKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripModelImplCopyWith<$Res>
    implements $TripModelCopyWith<$Res> {
  factory _$$TripModelImplCopyWith(
          _$TripModelImpl value, $Res Function(_$TripModelImpl) then) =
      __$$TripModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'trip_id') String tripId,
      @JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'transporter_id') String transporterId,
      @JsonKey(name: 'current_latitude') double? currentLatitude,
      @JsonKey(name: 'current_longitude') double? currentLongitude,
      @JsonKey(name: 'heading') double? heading,
      String status,
      @JsonKey(name: 'estimated_arrival_time')
      @TimestampConverter()
      DateTime? estimatedArrivalTime,
      @JsonKey(name: 'distance_remaining_km') double? distanceRemainingKm,
      @JsonKey(name: 'started_at') @TimestampConverter() DateTime? startedAt,
      @JsonKey(name: 'picked_up_at') @TimestampConverter() DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      DateTime? deliveredAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$TripModelImplCopyWithImpl<$Res>
    extends _$TripModelCopyWithImpl<$Res, _$TripModelImpl>
    implements _$$TripModelImplCopyWith<$Res> {
  __$$TripModelImplCopyWithImpl(
      _$TripModelImpl _value, $Res Function(_$TripModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? jobId = null,
    Object? transporterId = null,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? heading = freezed,
    Object? status = null,
    Object? estimatedArrivalTime = freezed,
    Object? distanceRemainingKm = freezed,
    Object? startedAt = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TripModelImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      transporterId: null == transporterId
          ? _value.transporterId
          : transporterId // ignore: cast_nullable_to_non_nullable
              as String,
      currentLatitude: freezed == currentLatitude
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      currentLongitude: freezed == currentLongitude
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedArrivalTime: freezed == estimatedArrivalTime
          ? _value.estimatedArrivalTime
          : estimatedArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distanceRemainingKm: freezed == distanceRemainingKm
          ? _value.distanceRemainingKm
          : distanceRemainingKm // ignore: cast_nullable_to_non_nullable
              as double?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedUpAt: freezed == pickedUpAt
          ? _value.pickedUpAt
          : pickedUpAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
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
class _$TripModelImpl implements _TripModel {
  const _$TripModelImpl(
      {@JsonKey(name: 'trip_id') required this.tripId,
      @JsonKey(name: 'job_id') required this.jobId,
      @JsonKey(name: 'transporter_id') required this.transporterId,
      @JsonKey(name: 'current_latitude') this.currentLatitude,
      @JsonKey(name: 'current_longitude') this.currentLongitude,
      @JsonKey(name: 'heading') this.heading,
      this.status = 'EN_ROUTE_TO_PICKUP',
      @JsonKey(name: 'estimated_arrival_time')
      @TimestampConverter()
      this.estimatedArrivalTime,
      @JsonKey(name: 'distance_remaining_km') this.distanceRemainingKm,
      @JsonKey(name: 'started_at') @TimestampConverter() this.startedAt,
      @JsonKey(name: 'picked_up_at') @TimestampConverter() this.pickedUpAt,
      @JsonKey(name: 'delivered_at') @TimestampConverter() this.deliveredAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$TripModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripModelImplFromJson(json);

  @override
  @JsonKey(name: 'trip_id')
  final String tripId;
  @override
  @JsonKey(name: 'job_id')
  final String jobId;
  @override
  @JsonKey(name: 'transporter_id')
  final String transporterId;
// Live Location
  @override
  @JsonKey(name: 'current_latitude')
  final double? currentLatitude;
  @override
  @JsonKey(name: 'current_longitude')
  final double? currentLongitude;
  @override
  @JsonKey(name: 'heading')
  final double? heading;
// Status: 'EN_ROUTE_TO_PICKUP', 'AT_PICKUP', 'EN_ROUTE_TO_DELIVERY', 'DELIVERED', 'COMPLETED'
  @override
  @JsonKey()
  final String status;
// ETA information
  @override
  @JsonKey(name: 'estimated_arrival_time')
  @TimestampConverter()
  final DateTime? estimatedArrivalTime;
  @override
  @JsonKey(name: 'distance_remaining_km')
  final double? distanceRemainingKm;
  @override
  @JsonKey(name: 'started_at')
  @TimestampConverter()
  final DateTime? startedAt;
  @override
  @JsonKey(name: 'picked_up_at')
  @TimestampConverter()
  final DateTime? pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TripModel(tripId: $tripId, jobId: $jobId, transporterId: $transporterId, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, heading: $heading, status: $status, estimatedArrivalTime: $estimatedArrivalTime, distanceRemainingKm: $distanceRemainingKm, startedAt: $startedAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripModelImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.transporterId, transporterId) ||
                other.transporterId == transporterId) &&
            (identical(other.currentLatitude, currentLatitude) ||
                other.currentLatitude == currentLatitude) &&
            (identical(other.currentLongitude, currentLongitude) ||
                other.currentLongitude == currentLongitude) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.estimatedArrivalTime, estimatedArrivalTime) ||
                other.estimatedArrivalTime == estimatedArrivalTime) &&
            (identical(other.distanceRemainingKm, distanceRemainingKm) ||
                other.distanceRemainingKm == distanceRemainingKm) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tripId,
      jobId,
      transporterId,
      currentLatitude,
      currentLongitude,
      heading,
      status,
      estimatedArrivalTime,
      distanceRemainingKm,
      startedAt,
      pickedUpAt,
      deliveredAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      __$$TripModelImplCopyWithImpl<_$TripModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripModelImplToJson(
      this,
    );
  }
}

abstract class _TripModel implements TripModel {
  const factory _TripModel(
      {@JsonKey(name: 'trip_id') required final String tripId,
      @JsonKey(name: 'job_id') required final String jobId,
      @JsonKey(name: 'transporter_id') required final String transporterId,
      @JsonKey(name: 'current_latitude') final double? currentLatitude,
      @JsonKey(name: 'current_longitude') final double? currentLongitude,
      @JsonKey(name: 'heading') final double? heading,
      final String status,
      @JsonKey(name: 'estimated_arrival_time')
      @TimestampConverter()
      final DateTime? estimatedArrivalTime,
      @JsonKey(name: 'distance_remaining_km') final double? distanceRemainingKm,
      @JsonKey(name: 'started_at')
      @TimestampConverter()
      final DateTime? startedAt,
      @JsonKey(name: 'picked_up_at')
      @TimestampConverter()
      final DateTime? pickedUpAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      final DateTime? deliveredAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$TripModelImpl;

  factory _TripModel.fromJson(Map<String, dynamic> json) =
      _$TripModelImpl.fromJson;

  @override
  @JsonKey(name: 'trip_id')
  String get tripId;
  @override
  @JsonKey(name: 'job_id')
  String get jobId;
  @override
  @JsonKey(name: 'transporter_id')
  String get transporterId;
  @override // Live Location
  @JsonKey(name: 'current_latitude')
  double? get currentLatitude;
  @override
  @JsonKey(name: 'current_longitude')
  double? get currentLongitude;
  @override
  @JsonKey(name: 'heading')
  double? get heading;
  @override // Status: 'EN_ROUTE_TO_PICKUP', 'AT_PICKUP', 'EN_ROUTE_TO_DELIVERY', 'DELIVERED', 'COMPLETED'
  String get status;
  @override // ETA information
  @JsonKey(name: 'estimated_arrival_time')
  @TimestampConverter()
  DateTime? get estimatedArrivalTime;
  @override
  @JsonKey(name: 'distance_remaining_km')
  double? get distanceRemainingKm;
  @override
  @JsonKey(name: 'started_at')
  @TimestampConverter()
  DateTime? get startedAt;
  @override
  @JsonKey(name: 'picked_up_at')
  @TimestampConverter()
  DateTime? get pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  DateTime? get deliveredAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
