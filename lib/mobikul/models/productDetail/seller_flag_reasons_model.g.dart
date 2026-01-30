// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_flag_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerFlagReasonsModel _$SellerFlagReasonsModelFromJson(
        Map<String, dynamic> json) =>
    SellerFlagReasonsModel(
      entity_id: (json['entity_id'] as num?)?.toInt(),
      reason: json['reason'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$SellerFlagReasonsModelToJson(
        SellerFlagReasonsModel instance) =>
    <String, dynamic>{
      'entity_id': instance.entity_id,
      'reason': instance.reason,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
    };
