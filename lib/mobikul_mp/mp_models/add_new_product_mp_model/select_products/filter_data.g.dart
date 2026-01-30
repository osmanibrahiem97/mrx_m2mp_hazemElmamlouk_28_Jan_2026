// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterOption _$FilterOptionFromJson(Map<String, dynamic> json) => FilterOption(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterOptionToJson(FilterOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'options': instance.options,
    };
