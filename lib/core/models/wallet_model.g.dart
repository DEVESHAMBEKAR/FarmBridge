// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      userId: json['user_id'] as String,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'balance': instance.balance,
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

_$WalletTransactionModelImpl _$$WalletTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionModelImpl(
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      referenceId: json['reference_id'] as String?,
      status: json['status'] as String? ?? 'completed',
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
    );

Map<String, dynamic> _$$WalletTransactionModelImplToJson(
        _$WalletTransactionModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'description': instance.description,
      'reference_id': instance.referenceId,
      'status': instance.status,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
