import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    @JsonKey(name: 'user_id') required String userId,
    @Default(0) double balance,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}

@freezed
class WalletTransactionModel with _$WalletTransactionModel {
  const factory WalletTransactionModel({
    required String type,
    required double amount,
    @Default('') String description,
    @JsonKey(name: 'reference_id') String? referenceId,
    @Default('completed') String status,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
  }) = _WalletTransactionModel;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) => _$WalletTransactionModelFromJson(json);
}
