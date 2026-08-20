// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      displayName: json['display_name'] as String? ?? '',
      photoUrl: json['photo_url'] as String?,
      role: json['role'] as String? ?? 'buyer',
      isProfileComplete: json['is_profile_complete'] as bool? ?? false,
      isVerified: json['is_verified'] as bool? ?? false,
      fcmToken: json['fcm_token'] as String?,
      verificationStatus: json['verification_status'] as String? ?? 'PENDING',
      status: json['status'] as String? ?? 'ACTIVE',
      farmerProfile: json['farmer_profile'] == null
          ? null
          : FarmerProfile.fromJson(
              json['farmer_profile'] as Map<String, dynamic>),
      buyerProfile: json['buyer_profile'] == null
          ? null
          : BuyerProfile.fromJson(
              json['buyer_profile'] as Map<String, dynamic>),
      dealerProfile: json['dealer_profile'] == null
          ? null
          : DealerProfile.fromJson(
              json['dealer_profile'] as Map<String, dynamic>),
      wholesalerProfile: json['wholesaler_profile'] == null
          ? null
          : WholesalerProfile.fromJson(
              json['wholesaler_profile'] as Map<String, dynamic>),
      retailerProfile: json['retailer_profile'] == null
          ? null
          : RetailerProfile.fromJson(
              json['retailer_profile'] as Map<String, dynamic>),
      logisticsProfile: json['logistics_profile'] == null
          ? null
          : LogisticsProfile.fromJson(
              json['logistics_profile'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'phone': instance.phone,
      'email': instance.email,
      'display_name': instance.displayName,
      'photo_url': instance.photoUrl,
      'role': instance.role,
      'is_profile_complete': instance.isProfileComplete,
      'is_verified': instance.isVerified,
      'fcm_token': instance.fcmToken,
      'verification_status': instance.verificationStatus,
      'status': instance.status,
      'farmer_profile': instance.farmerProfile,
      'buyer_profile': instance.buyerProfile,
      'dealer_profile': instance.dealerProfile,
      'wholesaler_profile': instance.wholesalerProfile,
      'retailer_profile': instance.retailerProfile,
      'logistics_profile': instance.logisticsProfile,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

_$FarmerProfileImpl _$$FarmerProfileImplFromJson(Map<String, dynamic> json) =>
    _$FarmerProfileImpl(
      farmName: json['farm_name'] as String? ?? '',
      farmAddress: json['farm_address'] as String? ?? '',
      farmSizeAcres: (json['farm_size_acres'] as num?)?.toDouble() ?? 0,
      cropsGrown: (json['crops_grown'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      organicCertified: json['organic_certified'] as bool? ?? false,
      bankAccountLinked: json['bank_account_linked'] as bool? ?? false,
    );

Map<String, dynamic> _$$FarmerProfileImplToJson(_$FarmerProfileImpl instance) =>
    <String, dynamic>{
      'farm_name': instance.farmName,
      'farm_address': instance.farmAddress,
      'farm_size_acres': instance.farmSizeAcres,
      'crops_grown': instance.cropsGrown,
      'organic_certified': instance.organicCertified,
      'bank_account_linked': instance.bankAccountLinked,
    };

_$BuyerProfileImpl _$$BuyerProfileImplFromJson(Map<String, dynamic> json) =>
    _$BuyerProfileImpl(
      deliveryAddress: json['delivery_address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      preferredCategories: (json['preferred_categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BuyerProfileImplToJson(_$BuyerProfileImpl instance) =>
    <String, dynamic>{
      'delivery_address': instance.deliveryAddress,
      'city': instance.city,
      'pincode': instance.pincode,
      'preferred_categories': instance.preferredCategories,
    };

_$LogisticsProfileImpl _$$LogisticsProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$LogisticsProfileImpl(
      vehicleType: json['vehicle_type'] as String? ?? '',
      vehicleNumber: json['vehicle_number'] as String? ?? '',
      licenseNumber: json['license_number'] as String? ?? '',
      serviceArea: (json['service_area'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isAvailable: json['is_available'] as bool? ?? true,
    );

Map<String, dynamic> _$$LogisticsProfileImplToJson(
        _$LogisticsProfileImpl instance) =>
    <String, dynamic>{
      'vehicle_type': instance.vehicleType,
      'vehicle_number': instance.vehicleNumber,
      'license_number': instance.licenseNumber,
      'service_area': instance.serviceArea,
      'is_available': instance.isAvailable,
    };

_$DealerProfileImpl _$$DealerProfileImplFromJson(Map<String, dynamic> json) =>
    _$DealerProfileImpl(
      deliveryAddress: json['delivery_address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      preferredCategories: (json['preferred_categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gstNumber: json['gst_number'] as String? ?? '',
      businessName: json['business_name'] as String? ?? '',
      businessType: json['business_type'] as String? ?? '',
    );

Map<String, dynamic> _$$DealerProfileImplToJson(_$DealerProfileImpl instance) =>
    <String, dynamic>{
      'delivery_address': instance.deliveryAddress,
      'city': instance.city,
      'pincode': instance.pincode,
      'preferred_categories': instance.preferredCategories,
      'gst_number': instance.gstNumber,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
    };

_$WholesalerProfileImpl _$$WholesalerProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$WholesalerProfileImpl(
      deliveryAddress: json['delivery_address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      preferredCategories: (json['preferred_categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gstNumber: json['gst_number'] as String? ?? '',
      businessName: json['business_name'] as String? ?? '',
      businessType: json['business_type'] as String? ?? '',
    );

Map<String, dynamic> _$$WholesalerProfileImplToJson(
        _$WholesalerProfileImpl instance) =>
    <String, dynamic>{
      'delivery_address': instance.deliveryAddress,
      'city': instance.city,
      'pincode': instance.pincode,
      'preferred_categories': instance.preferredCategories,
      'gst_number': instance.gstNumber,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
    };

_$RetailerProfileImpl _$$RetailerProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$RetailerProfileImpl(
      deliveryAddress: json['delivery_address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      preferredCategories: (json['preferred_categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gstNumber: json['gst_number'] as String? ?? '',
      businessName: json['business_name'] as String? ?? '',
      businessType: json['business_type'] as String? ?? '',
    );

Map<String, dynamic> _$$RetailerProfileImplToJson(
        _$RetailerProfileImpl instance) =>
    <String, dynamic>{
      'delivery_address': instance.deliveryAddress,
      'city': instance.city,
      'pincode': instance.pincode,
      'preferred_categories': instance.preferredCategories,
      'gst_number': instance.gstNumber,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
    };
