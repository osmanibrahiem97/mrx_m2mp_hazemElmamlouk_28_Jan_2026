// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_another_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAnotherLinkModel _$AddAnotherLinkModelFromJson(Map<String, dynamic> json) =>
    AddAnotherLinkModel(
      (json['id'] as num?)?.toInt(),
      json['linkTitle'] as String?,
      json['linkPrice'] as String?,
      json['linkType'] as String?,
      json['linkFile'] as String?,
      json['linkUrl'] as String?,
      json['sampleType'] as String?,
      json['sampleFile'] as String?,
      json['sampleLink'] as String?,
      json['isLinkShareable'] as bool?,
      json['isUnlimited'] as bool?,
      json['maxDownload'] as String?,
      json['isVisible'] as bool?,
      json['isDeleted'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$AddAnotherLinkModelToJson(
        AddAnotherLinkModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'id': instance.id,
      'linkTitle': instance.linkTitle,
      'linkPrice': instance.linkPrice,
      'linkType': instance.linkType,
      'linkFile': instance.linkFile,
      'linkUrl': instance.linkUrl,
      'sampleType': instance.sampleType,
      'sampleFile': instance.sampleFile,
      'sampleLink': instance.sampleLink,
      'isLinkShareable': instance.isLinkShareable,
      'isUnlimited': instance.isUnlimited,
      'maxDownload': instance.maxDownload,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };
