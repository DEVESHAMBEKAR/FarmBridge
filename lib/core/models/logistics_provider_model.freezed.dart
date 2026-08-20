// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logistics_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogisticsProviderModel _$LogisticsProviderModelFromJson(
    Map<String, dynamic> json) {
  return _LogisticsProviderModel.fromJson(json);
}

/// @nodoc
mixin _$LogisticsProviderModel {
  @JsonKey(name: 'provider_id')
  String get providerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_type')
  String get providerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_enabled')
  bool get apiEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_enabled')
  bool get bookingEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_enabled')
  bool get trackingEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing_enabled')
  bool get pricingEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_areas')
  List<String> get serviceAreas => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_types')
  List<String> get vehicleTypes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogisticsProviderModelCopyWith<LogisticsProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogisticsProviderModelCopyWith<$Res> {
  factory $LogisticsProviderModelCopyWith(LogisticsProviderModel value,
          $Res Function(LogisticsProviderModel) then) =
      _$LogisticsProviderModelCopyWithImpl<$Res, LogisticsProviderModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_id') String providerId,
      String name,
      String? logo,
      @JsonKey(name: 'provider_type') String providerType,
      @JsonKey(name: 'api_enabled') bool apiEnabled,
      @JsonKey(name: 'booking_enabled') bool bookingEnabled,
      @JsonKey(name: 'tracking_enabled') bool trackingEnabled,
      @JsonKey(name: 'pricing_enabled') bool pricingEnabled,
      @JsonKey(name: 'service_areas') List<String> serviceAreas,
      @JsonKey(name: 'vehicle_types') List<String> vehicleTypes,
      String status});
}

/// @nodoc
class _$LogisticsProviderModelCopyWithImpl<$Res,
        $Val extends LogisticsProviderModel>
    implements $LogisticsProviderModelCopyWith<$Res> {
  _$LogisticsProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? name = null,
    Object? logo = freezed,
    Object? providerType = null,
    Object? apiEnabled = null,
    Object? bookingEnabled = null,
    Object? trackingEnabled = null,
    Object? pricingEnabled = null,
    Object? serviceAreas = null,
    Object? vehicleTypes = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      apiEnabled: null == apiEnabled
          ? _value.apiEnabled
          : apiEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingEnabled: null == bookingEnabled
          ? _value.bookingEnabled
          : bookingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      trackingEnabled: null == trackingEnabled
          ? _value.trackingEnabled
          : trackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pricingEnabled: null == pricingEnabled
          ? _value.pricingEnabled
          : pricingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceAreas: null == serviceAreas
          ? _value.serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleTypes: null == vehicleTypes
          ? _value.vehicleTypes
          : vehicleTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogisticsProviderModelImplCopyWith<$Res>
    implements $LogisticsProviderModelCopyWith<$Res> {
  factory _$$LogisticsProviderModelImplCopyWith(
          _$LogisticsProviderModelImpl value,
          $Res Function(_$LogisticsProviderModelImpl) then) =
      __$$LogisticsProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_id') String providerId,
      String name,
      String? logo,
      @JsonKey(name: 'provider_type') String providerType,
      @JsonKey(name: 'api_enabled') bool apiEnabled,
      @JsonKey(name: 'booking_enabled') bool bookingEnabled,
      @JsonKey(name: 'tracking_enabled') bool trackingEnabled,
      @JsonKey(name: 'pricing_enabled') bool pricingEnabled,
      @JsonKey(name: 'service_areas') List<String> serviceAreas,
      @JsonKey(name: 'vehicle_types') List<String> vehicleTypes,
      String status});
}

/// @nodoc
class __$$LogisticsProviderModelImplCopyWithImpl<$Res>
    extends _$LogisticsProviderModelCopyWithImpl<$Res,
        _$LogisticsProviderModelImpl>
    implements _$$LogisticsProviderModelImplCopyWith<$Res> {
  __$$LogisticsProviderModelImplCopyWithImpl(
      _$LogisticsProviderModelImpl _value,
      $Res Function(_$LogisticsProviderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? name = null,
    Object? logo = freezed,
    Object? providerType = null,
    Object? apiEnabled = null,
    Object? bookingEnabled = null,
    Object? trackingEnabled = null,
    Object? pricingEnabled = null,
    Object? serviceAreas = null,
    Object? vehicleTypes = null,
    Object? status = null,
  }) {
    return _then(_$LogisticsProviderModelImpl(
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      apiEnabled: null == apiEnabled
          ? _value.apiEnabled
          : apiEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingEnabled: null == bookingEnabled
          ? _value.bookingEnabled
          : bookingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      trackingEnabled: null == trackingEnabled
          ? _value.trackingEnabled
          : trackingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pricingEnabled: null == pricingEnabled
          ? _value.pricingEnabled
          : pricingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceAreas: null == serviceAreas
          ? _value._serviceAreas
          : serviceAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleTypes: null == vehicleTypes
          ? _value._vehicleTypes
          : vehicleTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogisticsProviderModelImpl implements _LogisticsProviderModel {
  const _$LogisticsProviderModelImpl(
      {@JsonKey(name: 'provider_id') required this.providerId,
      required this.name,
      this.logo,
      @JsonKey(name: 'provider_type') required this.providerType,
      @JsonKey(name: 'api_enabled') this.apiEnabled = false,
      @JsonKey(name: 'booking_enabled') this.bookingEnabled = true,
      @JsonKey(name: 'tracking_enabled') this.trackingEnabled = false,
      @JsonKey(name: 'pricing_enabled') this.pricingEnabled = false,
      @JsonKey(name: 'service_areas')
      final List<String> serviceAreas = const [],
      @JsonKey(name: 'vehicle_types')
      final List<String> vehicleTypes = const [],
      this.status = 'ACTIVE'})
      : _serviceAreas = serviceAreas,
        _vehicleTypes = vehicleTypes;

  factory _$LogisticsProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogisticsProviderModelImplFromJson(json);

  @override
  @JsonKey(name: 'provider_id')
  final String providerId;
  @override
  final String name;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'provider_type')
  final String providerType;
  @override
  @JsonKey(name: 'api_enabled')
  final bool apiEnabled;
  @override
  @JsonKey(name: 'booking_enabled')
  final bool bookingEnabled;
  @override
  @JsonKey(name: 'tracking_enabled')
  final bool trackingEnabled;
  @override
  @JsonKey(name: 'pricing_enabled')
  final bool pricingEnabled;
  final List<String> _serviceAreas;
  @override
  @JsonKey(name: 'service_areas')
  List<String> get serviceAreas {
    if (_serviceAreas is EqualUnmodifiableListView) return _serviceAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceAreas);
  }

  final List<String> _vehicleTypes;
  @override
  @JsonKey(name: 'vehicle_types')
  List<String> get vehicleTypes {
    if (_vehicleTypes is EqualUnmodifiableListView) return _vehicleTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicleTypes);
  }

  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'LogisticsProviderModel(providerId: $providerId, name: $name, logo: $logo, providerType: $providerType, apiEnabled: $apiEnabled, bookingEnabled: $bookingEnabled, trackingEnabled: $trackingEnabled, pricingEnabled: $pricingEnabled, serviceAreas: $serviceAreas, vehicleTypes: $vehicleTypes, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogisticsProviderModelImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.apiEnabled, apiEnabled) ||
                other.apiEnabled == apiEnabled) &&
            (identical(other.bookingEnabled, bookingEnabled) ||
                other.bookingEnabled == bookingEnabled) &&
            (identical(other.trackingEnabled, trackingEnabled) ||
                other.trackingEnabled == trackingEnabled) &&
            (identical(other.pricingEnabled, pricingEnabled) ||
                other.pricingEnabled == pricingEnabled) &&
            const DeepCollectionEquality()
                .equals(other._serviceAreas, _serviceAreas) &&
            const DeepCollectionEquality()
                .equals(other._vehicleTypes, _vehicleTypes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerId,
      name,
      logo,
      providerType,
      apiEnabled,
      bookingEnabled,
      trackingEnabled,
      pricingEnabled,
      const DeepCollectionEquality().hash(_serviceAreas),
      const DeepCollectionEquality().hash(_vehicleTypes),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogisticsProviderModelImplCopyWith<_$LogisticsProviderModelImpl>
      get copyWith => __$$LogisticsProviderModelImplCopyWithImpl<
          _$LogisticsProviderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogisticsProviderModelImplToJson(
      this,
    );
  }
}

abstract class _LogisticsProviderModel implements LogisticsProviderModel {
  const factory _LogisticsProviderModel(
      {@JsonKey(name: 'provider_id') required final String providerId,
      required final String name,
      final String? logo,
      @JsonKey(name: 'provider_type') required final String providerType,
      @JsonKey(name: 'api_enabled') final bool apiEnabled,
      @JsonKey(name: 'booking_enabled') final bool bookingEnabled,
      @JsonKey(name: 'tracking_enabled') final bool trackingEnabled,
      @JsonKey(name: 'pricing_enabled') final bool pricingEnabled,
      @JsonKey(name: 'service_areas') final List<String> serviceAreas,
      @JsonKey(name: 'vehicle_types') final List<String> vehicleTypes,
      final String status}) = _$LogisticsProviderModelImpl;

  factory _LogisticsProviderModel.fromJson(Map<String, dynamic> json) =
      _$LogisticsProviderModelImpl.fromJson;

  @override
  @JsonKey(name: 'provider_id')
  String get providerId;
  @override
  String get name;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'provider_type')
  String get providerType;
  @override
  @JsonKey(name: 'api_enabled')
  bool get apiEnabled;
  @override
  @JsonKey(name: 'booking_enabled')
  bool get bookingEnabled;
  @override
  @JsonKey(name: 'tracking_enabled')
  bool get trackingEnabled;
  @override
  @JsonKey(name: 'pricing_enabled')
  bool get pricingEnabled;
  @override
  @JsonKey(name: 'service_areas')
  List<String> get serviceAreas;
  @override
  @JsonKey(name: 'vehicle_types')
  List<String> get vehicleTypes;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$LogisticsProviderModelImplCopyWith<_$LogisticsProviderModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
