// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleDataModel _$SampleDataModelFromJson(Map<String, dynamic> json) =>
    SampleDataModel(
      json['type'] as String?,
      (json['file'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SampleDataModelToJson(SampleDataModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'type': instance.type,
      'file': instance.file,
    };
