// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImageUploadModel _$ProductImageUploadModelFromJson(
        Map<String, dynamic> json) =>
    ProductImageUploadModel(
      url: json['url'] as String?,
      file: json['file'] as String?,
      name: json['name'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$ProductImageUploadModelToJson(
        ProductImageUploadModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'url': instance.url,
      'file': instance.file,
      'name': instance.name,
    };
