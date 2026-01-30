// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      id: json['id'] as String?,
      label: json['label'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'products': instance.products,
    };
