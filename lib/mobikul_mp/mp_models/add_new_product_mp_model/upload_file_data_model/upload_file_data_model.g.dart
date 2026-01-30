// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadDownloadableProductFileModel _$UploadDownloadableProductFileModelFromJson(
        Map<String, dynamic> json) =>
    UploadDownloadableProductFileModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      file: json['file'] as String?,
      name: json['name'] as String?,
      size: json['size'],
    )
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$UploadDownloadableProductFileModelToJson(
        UploadDownloadableProductFileModel instance) =>
    <String, dynamic>{
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'success': instance.success,
      'message': instance.message,
      'file': instance.file,
      'name': instance.name,
      'size': instance.size,
    };
