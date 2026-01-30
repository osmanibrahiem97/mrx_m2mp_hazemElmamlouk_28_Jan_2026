// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flag_reasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlagReasons _$FlagReasonsFromJson(Map<String, dynamic> json) => FlagReasons(
      json['status'] as bool?,
      (json['entity_id'] as num?)?.toInt(),
      json['reason'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$FlagReasonsToJson(FlagReasons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'entity_id': instance.entity_id,
      'reason': instance.reason,
      'status': instance.status,
    };
