// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsMpModel _$OptionsMpModelFromJson(Map<String, dynamic> json) =>
    OptionsMpModel(
      id: json['id'] as String?,
      label: json['label'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OptionsMpModelToJson(OptionsMpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'products': instance.products,
    };
