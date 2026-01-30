// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_file_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleFileDataModel _$SampleFileDataModelFromJson(Map<String, dynamic> json) =>
    SampleFileDataModel(
      json['file'] as String?,
      json['name'] as String?,
      json['size'],
      json['status'] as String?,
      json['sample_id'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SampleFileDataModelToJson(
        SampleFileDataModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'sample_id': instance.sample_id,
      'file': instance.file,
      'size': instance.size,
      'status': instance.status,
      'name': instance.name,
    };
