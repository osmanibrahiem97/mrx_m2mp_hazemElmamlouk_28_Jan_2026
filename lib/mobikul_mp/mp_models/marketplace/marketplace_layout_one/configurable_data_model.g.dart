// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configurable_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurableData _$ConfigurableDataFromJson(Map<String, dynamic> json) =>
    ConfigurableData(
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      template: json['template'] as String?,
      optionPrices: (json['optionPrices'] as List<dynamic>?)
          ?.map((e) => OptionPrices.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: json['prices'] == null
          ? null
          : Prices.fromJson(json['prices'] as Map<String, dynamic>),
      productId: json['productId'] as String?,
      chooseText: json['chooseText'] as String?,
      images: json['images'] as String?,
      index: json['index'] as String?,
      swatchData: json['swatchData'] as String?,
    );

Map<String, dynamic> _$ConfigurableDataToJson(ConfigurableData instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'template': instance.template,
      'optionPrices': instance.optionPrices,
      'prices': instance.prices,
      'productId': instance.productId,
      'chooseText': instance.chooseText,
      'images': instance.images,
      'index': instance.index,
      'swatchData': instance.swatchData,
    };
