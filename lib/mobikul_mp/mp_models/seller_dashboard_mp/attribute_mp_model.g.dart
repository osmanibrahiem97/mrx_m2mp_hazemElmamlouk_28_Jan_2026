// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeMpModel _$AttributeMpModelFromJson(Map<String, dynamic> json) =>
    AttributeMpModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      label: json['label'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
      swatchType: json['swatchType'] as String?,
      updateProductPreviewImage: json['updateProductPreviewImage'] as bool?,
    );

Map<String, dynamic> _$AttributeMpModelToJson(AttributeMpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'options': instance.options,
      'position': instance.position,
      'swatchType': instance.swatchType,
      'updateProductPreviewImage': instance.updateProductPreviewImage,
    };
