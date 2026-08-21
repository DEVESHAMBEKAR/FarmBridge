// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_profile_complete')
  bool get isProfileComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String get verificationStatus => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_profile')
  FarmerProfile? get farmerProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_profile')
  BuyerProfile? get buyerProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'dealer_profile')
  DealerProfile? get dealerProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'wholesaler_profile')
  WholesalerProfile? get wholesalerProfile =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'retailer_profile')
  RetailerProfile? get retailerProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'logistics_profile')
  LogisticsProfile? get logisticsProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String? phone,
      String? email,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'photo_url') String? photoUrl,
      String role,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'is_profile_complete') bool isProfileComplete,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'verification_status') String verificationStatus,
      String status,
      @JsonKey(name: 'farmer_profile') FarmerProfile? farmerProfile,
      @JsonKey(name: 'buyer_profile') BuyerProfile? buyerProfile,
      @JsonKey(name: 'dealer_profile') DealerProfile? dealerProfile,
      @JsonKey(name: 'wholesaler_profile') WholesalerProfile? wholesalerProfile,
      @JsonKey(name: 'retailer_profile') RetailerProfile? retailerProfile,
      @JsonKey(name: 'logistics_profile') LogisticsProfile? logisticsProfile,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});

  $FarmerProfileCopyWith<$Res>? get farmerProfile;
  $BuyerProfileCopyWith<$Res>? get buyerProfile;
  $DealerProfileCopyWith<$Res>? get dealerProfile;
  $WholesalerProfileCopyWith<$Res>? get wholesalerProfile;
  $RetailerProfileCopyWith<$Res>? get retailerProfile;
  $LogisticsProfileCopyWith<$Res>? get logisticsProfile;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? displayName = null,
    Object? photoUrl = freezed,
    Object? role = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isProfileComplete = null,
    Object? isVerified = null,
    Object? fcmToken = freezed,
    Object? verificationStatus = null,
    Object? status = null,
    Object? farmerProfile = freezed,
    Object? buyerProfile = freezed,
    Object? dealerProfile = freezed,
    Object? wholesalerProfile = freezed,
    Object? retailerProfile = freezed,
    Object? logisticsProfile = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isProfileComplete: null == isProfileComplete
          ? _value.isProfileComplete
          : isProfileComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      farmerProfile: freezed == farmerProfile
          ? _value.farmerProfile
          : farmerProfile // ignore: cast_nullable_to_non_nullable
              as FarmerProfile?,
      buyerProfile: freezed == buyerProfile
          ? _value.buyerProfile
          : buyerProfile // ignore: cast_nullable_to_non_nullable
              as BuyerProfile?,
      dealerProfile: freezed == dealerProfile
          ? _value.dealerProfile
          : dealerProfile // ignore: cast_nullable_to_non_nullable
              as DealerProfile?,
      wholesalerProfile: freezed == wholesalerProfile
          ? _value.wholesalerProfile
          : wholesalerProfile // ignore: cast_nullable_to_non_nullable
              as WholesalerProfile?,
      retailerProfile: freezed == retailerProfile
          ? _value.retailerProfile
          : retailerProfile // ignore: cast_nullable_to_non_nullable
              as RetailerProfile?,
      logisticsProfile: freezed == logisticsProfile
          ? _value.logisticsProfile
          : logisticsProfile // ignore: cast_nullable_to_non_nullable
              as LogisticsProfile?,
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

  @override
  @pragma('vm:prefer-inline')
  $FarmerProfileCopyWith<$Res>? get farmerProfile {
    if (_value.farmerProfile == null) {
      return null;
    }

    return $FarmerProfileCopyWith<$Res>(_value.farmerProfile!, (value) {
      return _then(_value.copyWith(farmerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BuyerProfileCopyWith<$Res>? get buyerProfile {
    if (_value.buyerProfile == null) {
      return null;
    }

    return $BuyerProfileCopyWith<$Res>(_value.buyerProfile!, (value) {
      return _then(_value.copyWith(buyerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DealerProfileCopyWith<$Res>? get dealerProfile {
    if (_value.dealerProfile == null) {
      return null;
    }

    return $DealerProfileCopyWith<$Res>(_value.dealerProfile!, (value) {
      return _then(_value.copyWith(dealerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WholesalerProfileCopyWith<$Res>? get wholesalerProfile {
    if (_value.wholesalerProfile == null) {
      return null;
    }

    return $WholesalerProfileCopyWith<$Res>(_value.wholesalerProfile!, (value) {
      return _then(_value.copyWith(wholesalerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RetailerProfileCopyWith<$Res>? get retailerProfile {
    if (_value.retailerProfile == null) {
      return null;
    }

    return $RetailerProfileCopyWith<$Res>(_value.retailerProfile!, (value) {
      return _then(_value.copyWith(retailerProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LogisticsProfileCopyWith<$Res>? get logisticsProfile {
    if (_value.logisticsProfile == null) {
      return null;
    }

    return $LogisticsProfileCopyWith<$Res>(_value.logisticsProfile!, (value) {
      return _then(_value.copyWith(logisticsProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? phone,
      String? email,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'photo_url') String? photoUrl,
      String role,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'is_profile_complete') bool isProfileComplete,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'verification_status') String verificationStatus,
      String status,
      @JsonKey(name: 'farmer_profile') FarmerProfile? farmerProfile,
      @JsonKey(name: 'buyer_profile') BuyerProfile? buyerProfile,
      @JsonKey(name: 'dealer_profile') DealerProfile? dealerProfile,
      @JsonKey(name: 'wholesaler_profile') WholesalerProfile? wholesalerProfile,
      @JsonKey(name: 'retailer_profile') RetailerProfile? retailerProfile,
      @JsonKey(name: 'logistics_profile') LogisticsProfile? logisticsProfile,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});

  @override
  $FarmerProfileCopyWith<$Res>? get farmerProfile;
  @override
  $BuyerProfileCopyWith<$Res>? get buyerProfile;
  @override
  $DealerProfileCopyWith<$Res>? get dealerProfile;
  @override
  $WholesalerProfileCopyWith<$Res>? get wholesalerProfile;
  @override
  $RetailerProfileCopyWith<$Res>? get retailerProfile;
  @override
  $LogisticsProfileCopyWith<$Res>? get logisticsProfile;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? displayName = null,
    Object? photoUrl = freezed,
    Object? role = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isProfileComplete = null,
    Object? isVerified = null,
    Object? fcmToken = freezed,
    Object? verificationStatus = null,
    Object? status = null,
    Object? farmerProfile = freezed,
    Object? buyerProfile = freezed,
    Object? dealerProfile = freezed,
    Object? wholesalerProfile = freezed,
    Object? retailerProfile = freezed,
    Object? logisticsProfile = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isProfileComplete: null == isProfileComplete
          ? _value.isProfileComplete
          : isProfileComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      farmerProfile: freezed == farmerProfile
          ? _value.farmerProfile
          : farmerProfile // ignore: cast_nullable_to_non_nullable
              as FarmerProfile?,
      buyerProfile: freezed == buyerProfile
          ? _value.buyerProfile
          : buyerProfile // ignore: cast_nullable_to_non_nullable
              as BuyerProfile?,
      dealerProfile: freezed == dealerProfile
          ? _value.dealerProfile
          : dealerProfile // ignore: cast_nullable_to_non_nullable
              as DealerProfile?,
      wholesalerProfile: freezed == wholesalerProfile
          ? _value.wholesalerProfile
          : wholesalerProfile // ignore: cast_nullable_to_non_nullable
              as WholesalerProfile?,
      retailerProfile: freezed == retailerProfile
          ? _value.retailerProfile
          : retailerProfile // ignore: cast_nullable_to_non_nullable
              as RetailerProfile?,
      logisticsProfile: freezed == logisticsProfile
          ? _value.logisticsProfile
          : logisticsProfile // ignore: cast_nullable_to_non_nullable
              as LogisticsProfile?,
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
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.uid,
      this.phone,
      this.email,
      @JsonKey(name: 'display_name') this.displayName = '',
      @JsonKey(name: 'photo_url') this.photoUrl,
      this.role = 'buyer',
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'is_profile_complete') this.isProfileComplete = false,
      @JsonKey(name: 'is_verified') this.isVerified = false,
      @JsonKey(name: 'fcm_token') this.fcmToken,
      @JsonKey(name: 'verification_status') this.verificationStatus = 'PENDING',
      this.status = 'ACTIVE',
      @JsonKey(name: 'farmer_profile') this.farmerProfile,
      @JsonKey(name: 'buyer_profile') this.buyerProfile,
      @JsonKey(name: 'dealer_profile') this.dealerProfile,
      @JsonKey(name: 'wholesaler_profile') this.wholesalerProfile,
      @JsonKey(name: 'retailer_profile') this.retailerProfile,
      @JsonKey(name: 'logistics_profile') this.logisticsProfile,
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'is_profile_complete')
  final bool isProfileComplete;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;
  @override
  @JsonKey(name: 'verification_status')
  final String verificationStatus;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'farmer_profile')
  final FarmerProfile? farmerProfile;
  @override
  @JsonKey(name: 'buyer_profile')
  final BuyerProfile? buyerProfile;
  @override
  @JsonKey(name: 'dealer_profile')
  final DealerProfile? dealerProfile;
  @override
  @JsonKey(name: 'wholesaler_profile')
  final WholesalerProfile? wholesalerProfile;
  @override
  @JsonKey(name: 'retailer_profile')
  final RetailerProfile? retailerProfile;
  @override
  @JsonKey(name: 'logistics_profile')
  final LogisticsProfile? logisticsProfile;
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
    return 'UserModel(uid: $uid, phone: $phone, email: $email, displayName: $displayName, photoUrl: $photoUrl, role: $role, latitude: $latitude, longitude: $longitude, isProfileComplete: $isProfileComplete, isVerified: $isVerified, fcmToken: $fcmToken, verificationStatus: $verificationStatus, status: $status, farmerProfile: $farmerProfile, buyerProfile: $buyerProfile, dealerProfile: $dealerProfile, wholesalerProfile: $wholesalerProfile, retailerProfile: $retailerProfile, logisticsProfile: $logisticsProfile, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isProfileComplete, isProfileComplete) ||
                other.isProfileComplete == isProfileComplete) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.farmerProfile, farmerProfile) ||
                other.farmerProfile == farmerProfile) &&
            (identical(other.buyerProfile, buyerProfile) ||
                other.buyerProfile == buyerProfile) &&
            (identical(other.dealerProfile, dealerProfile) ||
                other.dealerProfile == dealerProfile) &&
            (identical(other.wholesalerProfile, wholesalerProfile) ||
                other.wholesalerProfile == wholesalerProfile) &&
            (identical(other.retailerProfile, retailerProfile) ||
                other.retailerProfile == retailerProfile) &&
            (identical(other.logisticsProfile, logisticsProfile) ||
                other.logisticsProfile == logisticsProfile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        phone,
        email,
        displayName,
        photoUrl,
        role,
        latitude,
        longitude,
        isProfileComplete,
        isVerified,
        fcmToken,
        verificationStatus,
        status,
        farmerProfile,
        buyerProfile,
        dealerProfile,
        wholesalerProfile,
        retailerProfile,
        logisticsProfile,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String uid,
      final String? phone,
      final String? email,
      @JsonKey(name: 'display_name') final String displayName,
      @JsonKey(name: 'photo_url') final String? photoUrl,
      final String role,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'is_profile_complete') final bool isProfileComplete,
      @JsonKey(name: 'is_verified') final bool isVerified,
      @JsonKey(name: 'fcm_token') final String? fcmToken,
      @JsonKey(name: 'verification_status') final String verificationStatus,
      final String status,
      @JsonKey(name: 'farmer_profile') final FarmerProfile? farmerProfile,
      @JsonKey(name: 'buyer_profile') final BuyerProfile? buyerProfile,
      @JsonKey(name: 'dealer_profile') final DealerProfile? dealerProfile,
      @JsonKey(name: 'wholesaler_profile')
      final WholesalerProfile? wholesalerProfile,
      @JsonKey(name: 'retailer_profile') final RetailerProfile? retailerProfile,
      @JsonKey(name: 'logistics_profile')
      final LogisticsProfile? logisticsProfile,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get uid;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  String get role;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'is_profile_complete')
  bool get isProfileComplete;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  @JsonKey(name: 'fcm_token')
  String? get fcmToken;
  @override
  @JsonKey(name: 'verification_status')
  String get verificationStatus;
  @override
  String get status;
  @override
  @JsonKey(name: 'farmer_profile')
  FarmerProfile? get farmerProfile;
  @override
  @JsonKey(name: 'buyer_profile')
  BuyerProfile? get buyerProfile;
  @override
  @JsonKey(name: 'dealer_profile')
  DealerProfile? get dealerProfile;
  @override
  @JsonKey(name: 'wholesaler_profile')
  WholesalerProfile? get wholesalerProfile;
  @override
  @JsonKey(name: 'retailer_profile')
  RetailerProfile? get retailerProfile;
  @override
  @JsonKey(name: 'logistics_profile')
  LogisticsProfile? get logisticsProfile;
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
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmerProfile _$FarmerProfileFromJson(Map<String, dynamic> json) {
  return _FarmerProfile.fromJson(json);
}

/// @nodoc
mixin _$FarmerProfile {
  @JsonKey(name: 'farm_name')
  String get farmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_address')
  String get farmAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_size_acres')
  double get farmSizeAcres => throw _privateConstructorUsedError;
  @JsonKey(name: 'crops_grown')
  List<String> get cropsGrown => throw _privateConstructorUsedError;
  @JsonKey(name: 'organic_certified')
  bool get organicCertified => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_linked')
  bool get bankAccountLinked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmerProfileCopyWith<FarmerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmerProfileCopyWith<$Res> {
  factory $FarmerProfileCopyWith(
          FarmerProfile value, $Res Function(FarmerProfile) then) =
      _$FarmerProfileCopyWithImpl<$Res, FarmerProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'farm_name') String farmName,
      @JsonKey(name: 'farm_address') String farmAddress,
      @JsonKey(name: 'farm_size_acres') double farmSizeAcres,
      @JsonKey(name: 'crops_grown') List<String> cropsGrown,
      @JsonKey(name: 'organic_certified') bool organicCertified,
      @JsonKey(name: 'bank_account_linked') bool bankAccountLinked});
}

/// @nodoc
class _$FarmerProfileCopyWithImpl<$Res, $Val extends FarmerProfile>
    implements $FarmerProfileCopyWith<$Res> {
  _$FarmerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? farmAddress = null,
    Object? farmSizeAcres = null,
    Object? cropsGrown = null,
    Object? organicCertified = null,
    Object? bankAccountLinked = null,
  }) {
    return _then(_value.copyWith(
      farmName: null == farmName
          ? _value.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      farmAddress: null == farmAddress
          ? _value.farmAddress
          : farmAddress // ignore: cast_nullable_to_non_nullable
              as String,
      farmSizeAcres: null == farmSizeAcres
          ? _value.farmSizeAcres
          : farmSizeAcres // ignore: cast_nullable_to_non_nullable
              as double,
      cropsGrown: null == cropsGrown
          ? _value.cropsGrown
          : cropsGrown // ignore: cast_nullable_to_non_nullable
              as List<String>,
      organicCertified: null == organicCertified
          ? _value.organicCertified
          : organicCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      bankAccountLinked: null == bankAccountLinked
          ? _value.bankAccountLinked
          : bankAccountLinked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmerProfileImplCopyWith<$Res>
    implements $FarmerProfileCopyWith<$Res> {
  factory _$$FarmerProfileImplCopyWith(
          _$FarmerProfileImpl value, $Res Function(_$FarmerProfileImpl) then) =
      __$$FarmerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'farm_name') String farmName,
      @JsonKey(name: 'farm_address') String farmAddress,
      @JsonKey(name: 'farm_size_acres') double farmSizeAcres,
      @JsonKey(name: 'crops_grown') List<String> cropsGrown,
      @JsonKey(name: 'organic_certified') bool organicCertified,
      @JsonKey(name: 'bank_account_linked') bool bankAccountLinked});
}

/// @nodoc
class __$$FarmerProfileImplCopyWithImpl<$Res>
    extends _$FarmerProfileCopyWithImpl<$Res, _$FarmerProfileImpl>
    implements _$$FarmerProfileImplCopyWith<$Res> {
  __$$FarmerProfileImplCopyWithImpl(
      _$FarmerProfileImpl _value, $Res Function(_$FarmerProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? farmAddress = null,
    Object? farmSizeAcres = null,
    Object? cropsGrown = null,
    Object? organicCertified = null,
    Object? bankAccountLinked = null,
  }) {
    return _then(_$FarmerProfileImpl(
      farmName: null == farmName
          ? _value.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      farmAddress: null == farmAddress
          ? _value.farmAddress
          : farmAddress // ignore: cast_nullable_to_non_nullable
              as String,
      farmSizeAcres: null == farmSizeAcres
          ? _value.farmSizeAcres
          : farmSizeAcres // ignore: cast_nullable_to_non_nullable
              as double,
      cropsGrown: null == cropsGrown
          ? _value._cropsGrown
          : cropsGrown // ignore: cast_nullable_to_non_nullable
              as List<String>,
      organicCertified: null == organicCertified
          ? _value.organicCertified
          : organicCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      bankAccountLinked: null == bankAccountLinked
          ? _value.bankAccountLinked
          : bankAccountLinked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmerProfileImpl implements _FarmerProfile {
  const _$FarmerProfileImpl(
      {@JsonKey(name: 'farm_name') this.farmName = '',
      @JsonKey(name: 'farm_address') this.farmAddress = '',
      @JsonKey(name: 'farm_size_acres') this.farmSizeAcres = 0,
      @JsonKey(name: 'crops_grown') final List<String> cropsGrown = const [],
      @JsonKey(name: 'organic_certified') this.organicCertified = false,
      @JsonKey(name: 'bank_account_linked') this.bankAccountLinked = false})
      : _cropsGrown = cropsGrown;

  factory _$FarmerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmerProfileImplFromJson(json);

  @override
  @JsonKey(name: 'farm_name')
  final String farmName;
  @override
  @JsonKey(name: 'farm_address')
  final String farmAddress;
  @override
  @JsonKey(name: 'farm_size_acres')
  final double farmSizeAcres;
  final List<String> _cropsGrown;
  @override
  @JsonKey(name: 'crops_grown')
  List<String> get cropsGrown {
    if (_cropsGrown is EqualUnmodifiableListView) return _cropsGrown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cropsGrown);
  }

  @override
  @JsonKey(name: 'organic_certified')
  final bool organicCertified;
  @override
  @JsonKey(name: 'bank_account_linked')
  final bool bankAccountLinked;

  @override
  String toString() {
    return 'FarmerProfile(farmName: $farmName, farmAddress: $farmAddress, farmSizeAcres: $farmSizeAcres, cropsGrown: $cropsGrown, organicCertified: $organicCertified, bankAccountLinked: $bankAccountLinked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmerProfileImpl &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            (identical(other.farmAddress, farmAddress) ||
                other.farmAddress == farmAddress) &&
            (identical(other.farmSizeAcres, farmSizeAcres) ||
                other.farmSizeAcres == farmSizeAcres) &&
            const DeepCollectionEquality()
                .equals(other._cropsGrown, _cropsGrown) &&
            (identical(other.organicCertified, organicCertified) ||
                other.organicCertified == organicCertified) &&
            (identical(other.bankAccountLinked, bankAccountLinked) ||
                other.bankAccountLinked == bankAccountLinked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmName,
      farmAddress,
      farmSizeAcres,
      const DeepCollectionEquality().hash(_cropsGrown),
      organicCertified,
      bankAccountLinked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmerProfileImplCopyWith<_$FarmerProfileImpl> get copyWith =>
      __$$FarmerProfileImplCopyWithImpl<_$FarmerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmerProfileImplToJson(
      this,
    );
  }
}

abstract class _FarmerProfile implements FarmerProfile {
  const factory _FarmerProfile(
          {@JsonKey(name: 'farm_name') final String farmName,
          @JsonKey(name: 'farm_address') final String farmAddress,
          @JsonKey(name: 'farm_size_acres') final double farmSizeAcres,
          @JsonKey(name: 'crops_grown') final List<String> cropsGrown,
          @JsonKey(name: 'organic_certified') final bool organicCertified,
          @JsonKey(name: 'bank_account_linked') final bool bankAccountLinked}) =
      _$FarmerProfileImpl;

  factory _FarmerProfile.fromJson(Map<String, dynamic> json) =
      _$FarmerProfileImpl.fromJson;

  @override
  @JsonKey(name: 'farm_name')
  String get farmName;
  @override
  @JsonKey(name: 'farm_address')
  String get farmAddress;
  @override
  @JsonKey(name: 'farm_size_acres')
  double get farmSizeAcres;
  @override
  @JsonKey(name: 'crops_grown')
  List<String> get cropsGrown;
  @override
  @JsonKey(name: 'organic_certified')
  bool get organicCertified;
  @override
  @JsonKey(name: 'bank_account_linked')
  bool get bankAccountLinked;
  @override
  @JsonKey(ignore: true)
  _$$FarmerProfileImplCopyWith<_$FarmerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuyerProfile _$BuyerProfileFromJson(Map<String, dynamic> json) {
  return _BuyerProfile.fromJson(json);
}

/// @nodoc
mixin _$BuyerProfile {
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyerProfileCopyWith<BuyerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerProfileCopyWith<$Res> {
  factory $BuyerProfileCopyWith(
          BuyerProfile value, $Res Function(BuyerProfile) then) =
      _$BuyerProfileCopyWithImpl<$Res, BuyerProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories});
}

/// @nodoc
class _$BuyerProfileCopyWithImpl<$Res, $Val extends BuyerProfile>
    implements $BuyerProfileCopyWith<$Res> {
  _$BuyerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
  }) {
    return _then(_value.copyWith(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value.preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyerProfileImplCopyWith<$Res>
    implements $BuyerProfileCopyWith<$Res> {
  factory _$$BuyerProfileImplCopyWith(
          _$BuyerProfileImpl value, $Res Function(_$BuyerProfileImpl) then) =
      __$$BuyerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories});
}

/// @nodoc
class __$$BuyerProfileImplCopyWithImpl<$Res>
    extends _$BuyerProfileCopyWithImpl<$Res, _$BuyerProfileImpl>
    implements _$$BuyerProfileImplCopyWith<$Res> {
  __$$BuyerProfileImplCopyWithImpl(
      _$BuyerProfileImpl _value, $Res Function(_$BuyerProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
  }) {
    return _then(_$BuyerProfileImpl(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value._preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyerProfileImpl implements _BuyerProfile {
  const _$BuyerProfileImpl(
      {@JsonKey(name: 'delivery_address') this.deliveryAddress = '',
      this.city = '',
      this.pincode = '',
      @JsonKey(name: 'preferred_categories')
      final List<String> preferredCategories = const []})
      : _preferredCategories = preferredCategories;

  factory _$BuyerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyerProfileImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String pincode;
  final List<String> _preferredCategories;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories {
    if (_preferredCategories is EqualUnmodifiableListView)
      return _preferredCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCategories);
  }

  @override
  String toString() {
    return 'BuyerProfile(deliveryAddress: $deliveryAddress, city: $city, pincode: $pincode, preferredCategories: $preferredCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyerProfileImpl &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            const DeepCollectionEquality()
                .equals(other._preferredCategories, _preferredCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deliveryAddress, city, pincode,
      const DeepCollectionEquality().hash(_preferredCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      __$$BuyerProfileImplCopyWithImpl<_$BuyerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyerProfileImplToJson(
      this,
    );
  }
}

abstract class _BuyerProfile implements BuyerProfile {
  const factory _BuyerProfile(
      {@JsonKey(name: 'delivery_address') final String deliveryAddress,
      final String city,
      final String pincode,
      @JsonKey(name: 'preferred_categories')
      final List<String> preferredCategories}) = _$BuyerProfileImpl;

  factory _BuyerProfile.fromJson(Map<String, dynamic> json) =
      _$BuyerProfileImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  String get city;
  @override
  String get pincode;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories;
  @override
  @JsonKey(ignore: true)
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogisticsProfile _$LogisticsProfileFromJson(Map<String, dynamic> json) {
  return _LogisticsProfile.fromJson(json);
}

/// @nodoc
mixin _$LogisticsProfile {
  @JsonKey(name: 'vehicle_type')
  String get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_number')
  String get vehicleNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_area')
  List<String> get serviceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogisticsProfileCopyWith<LogisticsProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogisticsProfileCopyWith<$Res> {
  factory $LogisticsProfileCopyWith(
          LogisticsProfile value, $Res Function(LogisticsProfile) then) =
      _$LogisticsProfileCopyWithImpl<$Res, LogisticsProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_type') String vehicleType,
      @JsonKey(name: 'vehicle_number') String vehicleNumber,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'service_area') List<String> serviceArea,
      @JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class _$LogisticsProfileCopyWithImpl<$Res, $Val extends LogisticsProfile>
    implements $LogisticsProfileCopyWith<$Res> {
  _$LogisticsProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = null,
    Object? vehicleNumber = null,
    Object? licenseNumber = null,
    Object? serviceArea = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArea: null == serviceArea
          ? _value.serviceArea
          : serviceArea // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogisticsProfileImplCopyWith<$Res>
    implements $LogisticsProfileCopyWith<$Res> {
  factory _$$LogisticsProfileImplCopyWith(_$LogisticsProfileImpl value,
          $Res Function(_$LogisticsProfileImpl) then) =
      __$$LogisticsProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_type') String vehicleType,
      @JsonKey(name: 'vehicle_number') String vehicleNumber,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'service_area') List<String> serviceArea,
      @JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class __$$LogisticsProfileImplCopyWithImpl<$Res>
    extends _$LogisticsProfileCopyWithImpl<$Res, _$LogisticsProfileImpl>
    implements _$$LogisticsProfileImplCopyWith<$Res> {
  __$$LogisticsProfileImplCopyWithImpl(_$LogisticsProfileImpl _value,
      $Res Function(_$LogisticsProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = null,
    Object? vehicleNumber = null,
    Object? licenseNumber = null,
    Object? serviceArea = null,
    Object? isAvailable = null,
  }) {
    return _then(_$LogisticsProfileImpl(
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArea: null == serviceArea
          ? _value._serviceArea
          : serviceArea // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogisticsProfileImpl implements _LogisticsProfile {
  const _$LogisticsProfileImpl(
      {@JsonKey(name: 'vehicle_type') this.vehicleType = '',
      @JsonKey(name: 'vehicle_number') this.vehicleNumber = '',
      @JsonKey(name: 'license_number') this.licenseNumber = '',
      @JsonKey(name: 'service_area') final List<String> serviceArea = const [],
      @JsonKey(name: 'is_available') this.isAvailable = true})
      : _serviceArea = serviceArea;

  factory _$LogisticsProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogisticsProfileImplFromJson(json);

  @override
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  final String vehicleNumber;
  @override
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  final List<String> _serviceArea;
  @override
  @JsonKey(name: 'service_area')
  List<String> get serviceArea {
    if (_serviceArea is EqualUnmodifiableListView) return _serviceArea;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceArea);
  }

  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;

  @override
  String toString() {
    return 'LogisticsProfile(vehicleType: $vehicleType, vehicleNumber: $vehicleNumber, licenseNumber: $licenseNumber, serviceArea: $serviceArea, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogisticsProfileImpl &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            const DeepCollectionEquality()
                .equals(other._serviceArea, _serviceArea) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vehicleType,
      vehicleNumber,
      licenseNumber,
      const DeepCollectionEquality().hash(_serviceArea),
      isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogisticsProfileImplCopyWith<_$LogisticsProfileImpl> get copyWith =>
      __$$LogisticsProfileImplCopyWithImpl<_$LogisticsProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogisticsProfileImplToJson(
      this,
    );
  }
}

abstract class _LogisticsProfile implements LogisticsProfile {
  const factory _LogisticsProfile(
          {@JsonKey(name: 'vehicle_type') final String vehicleType,
          @JsonKey(name: 'vehicle_number') final String vehicleNumber,
          @JsonKey(name: 'license_number') final String licenseNumber,
          @JsonKey(name: 'service_area') final List<String> serviceArea,
          @JsonKey(name: 'is_available') final bool isAvailable}) =
      _$LogisticsProfileImpl;

  factory _LogisticsProfile.fromJson(Map<String, dynamic> json) =
      _$LogisticsProfileImpl.fromJson;

  @override
  @JsonKey(name: 'vehicle_type')
  String get vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  String get vehicleNumber;
  @override
  @JsonKey(name: 'license_number')
  String get licenseNumber;
  @override
  @JsonKey(name: 'service_area')
  List<String> get serviceArea;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$LogisticsProfileImplCopyWith<_$LogisticsProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DealerProfile _$DealerProfileFromJson(Map<String, dynamic> json) {
  return _DealerProfile.fromJson(json);
}

/// @nodoc
mixin _$DealerProfile {
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'gst_number')
  String get gstNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_type')
  String get businessType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealerProfileCopyWith<DealerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealerProfileCopyWith<$Res> {
  factory $DealerProfileCopyWith(
          DealerProfile value, $Res Function(DealerProfile) then) =
      _$DealerProfileCopyWithImpl<$Res, DealerProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class _$DealerProfileCopyWithImpl<$Res, $Val extends DealerProfile>
    implements $DealerProfileCopyWith<$Res> {
  _$DealerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_value.copyWith(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value.preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DealerProfileImplCopyWith<$Res>
    implements $DealerProfileCopyWith<$Res> {
  factory _$$DealerProfileImplCopyWith(
          _$DealerProfileImpl value, $Res Function(_$DealerProfileImpl) then) =
      __$$DealerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class __$$DealerProfileImplCopyWithImpl<$Res>
    extends _$DealerProfileCopyWithImpl<$Res, _$DealerProfileImpl>
    implements _$$DealerProfileImplCopyWith<$Res> {
  __$$DealerProfileImplCopyWithImpl(
      _$DealerProfileImpl _value, $Res Function(_$DealerProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_$DealerProfileImpl(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value._preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DealerProfileImpl implements _DealerProfile {
  const _$DealerProfileImpl(
      {@JsonKey(name: 'delivery_address') this.deliveryAddress = '',
      this.city = '',
      this.pincode = '',
      @JsonKey(name: 'preferred_categories')
      final List<String> preferredCategories = const [],
      @JsonKey(name: 'gst_number') this.gstNumber = '',
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_type') this.businessType = ''})
      : _preferredCategories = preferredCategories;

  factory _$DealerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DealerProfileImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String pincode;
  final List<String> _preferredCategories;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories {
    if (_preferredCategories is EqualUnmodifiableListView)
      return _preferredCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCategories);
  }

  @override
  @JsonKey(name: 'gst_number')
  final String gstNumber;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_type')
  final String businessType;

  @override
  String toString() {
    return 'DealerProfile(deliveryAddress: $deliveryAddress, city: $city, pincode: $pincode, preferredCategories: $preferredCategories, gstNumber: $gstNumber, businessName: $businessName, businessType: $businessType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DealerProfileImpl &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            const DeepCollectionEquality()
                .equals(other._preferredCategories, _preferredCategories) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryAddress,
      city,
      pincode,
      const DeepCollectionEquality().hash(_preferredCategories),
      gstNumber,
      businessName,
      businessType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DealerProfileImplCopyWith<_$DealerProfileImpl> get copyWith =>
      __$$DealerProfileImplCopyWithImpl<_$DealerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DealerProfileImplToJson(
      this,
    );
  }
}

abstract class _DealerProfile implements DealerProfile {
  const factory _DealerProfile(
          {@JsonKey(name: 'delivery_address') final String deliveryAddress,
          final String city,
          final String pincode,
          @JsonKey(name: 'preferred_categories')
          final List<String> preferredCategories,
          @JsonKey(name: 'gst_number') final String gstNumber,
          @JsonKey(name: 'business_name') final String businessName,
          @JsonKey(name: 'business_type') final String businessType}) =
      _$DealerProfileImpl;

  factory _DealerProfile.fromJson(Map<String, dynamic> json) =
      _$DealerProfileImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  String get city;
  @override
  String get pincode;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories;
  @override
  @JsonKey(name: 'gst_number')
  String get gstNumber;
  @override
  @JsonKey(name: 'business_name')
  String get businessName;
  @override
  @JsonKey(name: 'business_type')
  String get businessType;
  @override
  @JsonKey(ignore: true)
  _$$DealerProfileImplCopyWith<_$DealerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WholesalerProfile _$WholesalerProfileFromJson(Map<String, dynamic> json) {
  return _WholesalerProfile.fromJson(json);
}

/// @nodoc
mixin _$WholesalerProfile {
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'gst_number')
  String get gstNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_type')
  String get businessType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WholesalerProfileCopyWith<WholesalerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WholesalerProfileCopyWith<$Res> {
  factory $WholesalerProfileCopyWith(
          WholesalerProfile value, $Res Function(WholesalerProfile) then) =
      _$WholesalerProfileCopyWithImpl<$Res, WholesalerProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class _$WholesalerProfileCopyWithImpl<$Res, $Val extends WholesalerProfile>
    implements $WholesalerProfileCopyWith<$Res> {
  _$WholesalerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_value.copyWith(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value.preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WholesalerProfileImplCopyWith<$Res>
    implements $WholesalerProfileCopyWith<$Res> {
  factory _$$WholesalerProfileImplCopyWith(_$WholesalerProfileImpl value,
          $Res Function(_$WholesalerProfileImpl) then) =
      __$$WholesalerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class __$$WholesalerProfileImplCopyWithImpl<$Res>
    extends _$WholesalerProfileCopyWithImpl<$Res, _$WholesalerProfileImpl>
    implements _$$WholesalerProfileImplCopyWith<$Res> {
  __$$WholesalerProfileImplCopyWithImpl(_$WholesalerProfileImpl _value,
      $Res Function(_$WholesalerProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_$WholesalerProfileImpl(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value._preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WholesalerProfileImpl implements _WholesalerProfile {
  const _$WholesalerProfileImpl(
      {@JsonKey(name: 'delivery_address') this.deliveryAddress = '',
      this.city = '',
      this.pincode = '',
      @JsonKey(name: 'preferred_categories')
      final List<String> preferredCategories = const [],
      @JsonKey(name: 'gst_number') this.gstNumber = '',
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_type') this.businessType = ''})
      : _preferredCategories = preferredCategories;

  factory _$WholesalerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$WholesalerProfileImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String pincode;
  final List<String> _preferredCategories;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories {
    if (_preferredCategories is EqualUnmodifiableListView)
      return _preferredCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCategories);
  }

  @override
  @JsonKey(name: 'gst_number')
  final String gstNumber;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_type')
  final String businessType;

  @override
  String toString() {
    return 'WholesalerProfile(deliveryAddress: $deliveryAddress, city: $city, pincode: $pincode, preferredCategories: $preferredCategories, gstNumber: $gstNumber, businessName: $businessName, businessType: $businessType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WholesalerProfileImpl &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            const DeepCollectionEquality()
                .equals(other._preferredCategories, _preferredCategories) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryAddress,
      city,
      pincode,
      const DeepCollectionEquality().hash(_preferredCategories),
      gstNumber,
      businessName,
      businessType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WholesalerProfileImplCopyWith<_$WholesalerProfileImpl> get copyWith =>
      __$$WholesalerProfileImplCopyWithImpl<_$WholesalerProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WholesalerProfileImplToJson(
      this,
    );
  }
}

abstract class _WholesalerProfile implements WholesalerProfile {
  const factory _WholesalerProfile(
          {@JsonKey(name: 'delivery_address') final String deliveryAddress,
          final String city,
          final String pincode,
          @JsonKey(name: 'preferred_categories')
          final List<String> preferredCategories,
          @JsonKey(name: 'gst_number') final String gstNumber,
          @JsonKey(name: 'business_name') final String businessName,
          @JsonKey(name: 'business_type') final String businessType}) =
      _$WholesalerProfileImpl;

  factory _WholesalerProfile.fromJson(Map<String, dynamic> json) =
      _$WholesalerProfileImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  String get city;
  @override
  String get pincode;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories;
  @override
  @JsonKey(name: 'gst_number')
  String get gstNumber;
  @override
  @JsonKey(name: 'business_name')
  String get businessName;
  @override
  @JsonKey(name: 'business_type')
  String get businessType;
  @override
  @JsonKey(ignore: true)
  _$$WholesalerProfileImplCopyWith<_$WholesalerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RetailerProfile _$RetailerProfileFromJson(Map<String, dynamic> json) {
  return _RetailerProfile.fromJson(json);
}

/// @nodoc
mixin _$RetailerProfile {
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'gst_number')
  String get gstNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_type')
  String get businessType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetailerProfileCopyWith<RetailerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailerProfileCopyWith<$Res> {
  factory $RetailerProfileCopyWith(
          RetailerProfile value, $Res Function(RetailerProfile) then) =
      _$RetailerProfileCopyWithImpl<$Res, RetailerProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class _$RetailerProfileCopyWithImpl<$Res, $Val extends RetailerProfile>
    implements $RetailerProfileCopyWith<$Res> {
  _$RetailerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_value.copyWith(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value.preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RetailerProfileImplCopyWith<$Res>
    implements $RetailerProfileCopyWith<$Res> {
  factory _$$RetailerProfileImplCopyWith(_$RetailerProfileImpl value,
          $Res Function(_$RetailerProfileImpl) then) =
      __$$RetailerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String deliveryAddress,
      String city,
      String pincode,
      @JsonKey(name: 'preferred_categories') List<String> preferredCategories,
      @JsonKey(name: 'gst_number') String gstNumber,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_type') String businessType});
}

/// @nodoc
class __$$RetailerProfileImplCopyWithImpl<$Res>
    extends _$RetailerProfileCopyWithImpl<$Res, _$RetailerProfileImpl>
    implements _$$RetailerProfileImplCopyWith<$Res> {
  __$$RetailerProfileImplCopyWithImpl(
      _$RetailerProfileImpl _value, $Res Function(_$RetailerProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = null,
    Object? city = null,
    Object? pincode = null,
    Object? preferredCategories = null,
    Object? gstNumber = null,
    Object? businessName = null,
    Object? businessType = null,
  }) {
    return _then(_$RetailerProfileImpl(
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      preferredCategories: null == preferredCategories
          ? _value._preferredCategories
          : preferredCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RetailerProfileImpl implements _RetailerProfile {
  const _$RetailerProfileImpl(
      {@JsonKey(name: 'delivery_address') this.deliveryAddress = '',
      this.city = '',
      this.pincode = '',
      @JsonKey(name: 'preferred_categories')
      final List<String> preferredCategories = const [],
      @JsonKey(name: 'gst_number') this.gstNumber = '',
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_type') this.businessType = ''})
      : _preferredCategories = preferredCategories;

  factory _$RetailerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetailerProfileImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String pincode;
  final List<String> _preferredCategories;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories {
    if (_preferredCategories is EqualUnmodifiableListView)
      return _preferredCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCategories);
  }

  @override
  @JsonKey(name: 'gst_number')
  final String gstNumber;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_type')
  final String businessType;

  @override
  String toString() {
    return 'RetailerProfile(deliveryAddress: $deliveryAddress, city: $city, pincode: $pincode, preferredCategories: $preferredCategories, gstNumber: $gstNumber, businessName: $businessName, businessType: $businessType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetailerProfileImpl &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            const DeepCollectionEquality()
                .equals(other._preferredCategories, _preferredCategories) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryAddress,
      city,
      pincode,
      const DeepCollectionEquality().hash(_preferredCategories),
      gstNumber,
      businessName,
      businessType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetailerProfileImplCopyWith<_$RetailerProfileImpl> get copyWith =>
      __$$RetailerProfileImplCopyWithImpl<_$RetailerProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetailerProfileImplToJson(
      this,
    );
  }
}

abstract class _RetailerProfile implements RetailerProfile {
  const factory _RetailerProfile(
          {@JsonKey(name: 'delivery_address') final String deliveryAddress,
          final String city,
          final String pincode,
          @JsonKey(name: 'preferred_categories')
          final List<String> preferredCategories,
          @JsonKey(name: 'gst_number') final String gstNumber,
          @JsonKey(name: 'business_name') final String businessName,
          @JsonKey(name: 'business_type') final String businessType}) =
      _$RetailerProfileImpl;

  factory _RetailerProfile.fromJson(Map<String, dynamic> json) =
      _$RetailerProfileImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  String get city;
  @override
  String get pincode;
  @override
  @JsonKey(name: 'preferred_categories')
  List<String> get preferredCategories;
  @override
  @JsonKey(name: 'gst_number')
  String get gstNumber;
  @override
  @JsonKey(name: 'business_name')
  String get businessName;
  @override
  @JsonKey(name: 'business_type')
  String get businessType;
  @override
  @JsonKey(ignore: true)
  _$$RetailerProfileImplCopyWith<_$RetailerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
