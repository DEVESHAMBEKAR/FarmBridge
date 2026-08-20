import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    String? phone,
    String? email,
    @JsonKey(name: 'display_name') @Default('') String displayName,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @Default('buyer') String role,
    @JsonKey(name: 'is_profile_complete') @Default(false) bool isProfileComplete,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'verification_status') @Default('PENDING') String verificationStatus,
    @Default('ACTIVE') String status,
    @JsonKey(name: 'farmer_profile') FarmerProfile? farmerProfile,
    @JsonKey(name: 'buyer_profile') BuyerProfile? buyerProfile,
    @JsonKey(name: 'dealer_profile') DealerProfile? dealerProfile,
    @JsonKey(name: 'wholesaler_profile') WholesalerProfile? wholesalerProfile,
    @JsonKey(name: 'retailer_profile') RetailerProfile? retailerProfile,
    @JsonKey(name: 'logistics_profile') LogisticsProfile? logisticsProfile,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class FarmerProfile with _$FarmerProfile {
  const factory FarmerProfile({
    @JsonKey(name: 'farm_name') @Default('') String farmName,
    @JsonKey(name: 'farm_address') @Default('') String farmAddress,
    @JsonKey(name: 'farm_size_acres') @Default(0) double farmSizeAcres,
    @JsonKey(name: 'crops_grown') @Default([]) List<String> cropsGrown,
    @JsonKey(name: 'organic_certified') @Default(false) bool organicCertified,
    @JsonKey(name: 'bank_account_linked') @Default(false) bool bankAccountLinked,
  }) = _FarmerProfile;

  factory FarmerProfile.fromJson(Map<String, dynamic> json) => _$FarmerProfileFromJson(json);
}

@freezed
class BuyerProfile with _$BuyerProfile {
  const factory BuyerProfile({
    @JsonKey(name: 'delivery_address') @Default('') String deliveryAddress,
    @Default('') String city,
    @Default('') String pincode,
    @JsonKey(name: 'preferred_categories') @Default([]) List<String> preferredCategories,
  }) = _BuyerProfile;

  factory BuyerProfile.fromJson(Map<String, dynamic> json) => _$BuyerProfileFromJson(json);
}

@freezed
class LogisticsProfile with _$LogisticsProfile {
  const factory LogisticsProfile({
    @JsonKey(name: 'vehicle_type') @Default('') String vehicleType,
    @JsonKey(name: 'vehicle_number') @Default('') String vehicleNumber,
    @JsonKey(name: 'license_number') @Default('') String licenseNumber,
    @JsonKey(name: 'service_area') @Default([]) List<String> serviceArea,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
  }) = _LogisticsProfile;

  factory LogisticsProfile.fromJson(Map<String, dynamic> json) => _$LogisticsProfileFromJson(json);
}

@freezed
class DealerProfile with _$DealerProfile {
  const factory DealerProfile({
    @JsonKey(name: 'delivery_address') @Default('') String deliveryAddress,
    @Default('') String city,
    @Default('') String pincode,
    @JsonKey(name: 'preferred_categories') @Default([]) List<String> preferredCategories,
    @JsonKey(name: 'gst_number') @Default('') String gstNumber,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_type') @Default('') String businessType,
  }) = _DealerProfile;

  factory DealerProfile.fromJson(Map<String, dynamic> json) => _$DealerProfileFromJson(json);
}

@freezed
class WholesalerProfile with _$WholesalerProfile {
  const factory WholesalerProfile({
    @JsonKey(name: 'delivery_address') @Default('') String deliveryAddress,
    @Default('') String city,
    @Default('') String pincode,
    @JsonKey(name: 'preferred_categories') @Default([]) List<String> preferredCategories,
    @JsonKey(name: 'gst_number') @Default('') String gstNumber,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_type') @Default('') String businessType,
  }) = _WholesalerProfile;

  factory WholesalerProfile.fromJson(Map<String, dynamic> json) => _$WholesalerProfileFromJson(json);
}

@freezed
class RetailerProfile with _$RetailerProfile {
  const factory RetailerProfile({
    @JsonKey(name: 'delivery_address') @Default('') String deliveryAddress,
    @Default('') String city,
    @Default('') String pincode,
    @JsonKey(name: 'preferred_categories') @Default([]) List<String> preferredCategories,
    @JsonKey(name: 'gst_number') @Default('') String gstNumber,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_type') @Default('') String businessType,
  }) = _RetailerProfile;

  factory RetailerProfile.fromJson(Map<String, dynamic> json) => _$RetailerProfileFromJson(json);
}
