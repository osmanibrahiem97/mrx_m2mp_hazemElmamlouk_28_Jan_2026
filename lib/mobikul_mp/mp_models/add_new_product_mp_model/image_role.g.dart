// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageRole _$ImageRoleFromJson(Map<String, dynamic> json) => ImageRole(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
      label: json['label'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$ImageRoleToJson(ImageRole instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'label': instance.label,
      'isSelected': instance.isSelected,
    };
