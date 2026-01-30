// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveProductModel _$SaveProductModelFromJson(Map<String, dynamic> json) =>
    SaveProductModel(
      productId: (json['productId'] as num?)?.toInt(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SaveProductModelToJson(SaveProductModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'productId': instance.productId,
    };
