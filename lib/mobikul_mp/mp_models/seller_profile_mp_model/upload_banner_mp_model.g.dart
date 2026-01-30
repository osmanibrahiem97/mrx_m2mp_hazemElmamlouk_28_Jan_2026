// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_banner_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadBannerMpModel _$UploadBannerMpModelFromJson(Map<String, dynamic> json) =>
    UploadBannerMpModel(
      url: json['url'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$UploadBannerMpModelToJson(
        UploadBannerMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'url': instance.url,
    };
