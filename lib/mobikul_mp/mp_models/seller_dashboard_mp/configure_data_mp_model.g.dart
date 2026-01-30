// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configure_data_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigureDataMpModel _$ConfigureDataMpModelFromJson(
        Map<String, dynamic> json) =>
    ConfigureDataMpModel(
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => AttributeMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      template: json['template'] as String?,
      optionPrices: (json['optionPrices'] as List<dynamic>?)
          ?.map((e) => OptionPriceMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: json['prices'] == null
          ? null
          : PricesMpModel.fromJson(json['prices'] as Map<String, dynamic>),
      productId: json['productId'] as String?,
      chooseText: json['chooseText'] as String?,
      images: json['images'] as String?,
      index: json['index'] as String?,
      swatchData: json['swatchData'] as String?,
    );

Map<String, dynamic> _$ConfigureDataMpModelToJson(
        ConfigureDataMpModel instance) =>
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
