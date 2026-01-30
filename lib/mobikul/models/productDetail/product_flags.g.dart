// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_flags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFlags _$ProductFlagsFromJson(Map<String, dynamic> json) => ProductFlags(
      json['text'] as String?,
      json['guestCanFlag'] as bool?,
      json['reason'] as bool?,
      json['acceptOtherReasons'] as bool?,
      json['otherFieldPlaceholder'] as String?,
      (json['flagReasons'] as List<dynamic>?)
          ?.map((e) => FlagReasons.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$ProductFlagsToJson(ProductFlags instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'text': instance.text,
      'guestCanFlag': instance.guestCanFlag,
      'reason': instance.reason,
      'acceptOtherReasons': instance.acceptOtherReasons,
      'otherFieldPlaceholder': instance.otherFieldPlaceholder,
      'flagReasons': instance.flagReasons,
    };
