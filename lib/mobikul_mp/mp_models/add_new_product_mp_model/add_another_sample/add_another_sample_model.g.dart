// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_another_sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAnotherSampleModel _$AddAnotherSampleModelFromJson(
        Map<String, dynamic> json) =>
    AddAnotherSampleModel(
      (json['id'] as num?)?.toInt(),
      json['isVisible'] as bool,
      sampleTitle: json['sampleTitle'] as String?,
      sampleType: json['sampleType'] as String?,
      sampleFile: json['sampleFile'] as String?,
      sampleUrl: json['sampleUrl'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$AddAnotherSampleModelToJson(
        AddAnotherSampleModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'id': instance.id,
      'sampleTitle': instance.sampleTitle,
      'sampleType': instance.sampleType,
      'sampleFile': instance.sampleFile,
      'sampleUrl': instance.sampleUrl,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };
