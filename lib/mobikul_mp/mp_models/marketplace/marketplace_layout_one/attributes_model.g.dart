// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      id: json['id'] as String?,
      code: json['code'] as String?,
      label: json['label'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
      swatchType: json['swatchType'] as String?,
      updateProductPreviewImage: json['updateProductPreviewImage'] as bool?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'options': instance.options,
      'position': instance.position,
      'swatchType': instance.swatchType,
      'updateProductPreviewImage': instance.updateProductPreviewImage,
    };
