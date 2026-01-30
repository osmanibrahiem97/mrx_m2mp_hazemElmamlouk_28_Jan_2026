// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_price_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionPriceMpModel _$OptionPriceMpModelFromJson(Map<String, dynamic> json) =>
    OptionPriceMpModel(
      oldPrice: json['oldPrice'] == null
          ? null
          : OldPriceMpModel.fromJson(json['oldPrice'] as Map<String, dynamic>),
      basePrice: json['basePrice'] == null
          ? null
          : OldPriceMpModel.fromJson(json['basePrice'] as Map<String, dynamic>),
      finalPrice: json['finalPrice'] == null
          ? null
          : OldPriceMpModel.fromJson(
              json['finalPrice'] as Map<String, dynamic>),
      tierPrices: json['tierPrices'] as List<dynamic>?,
      msrpPrice: json['msrpPrice'] == null
          ? null
          : MsrpPriceMpModel.fromJson(
              json['msrpPrice'] as Map<String, dynamic>),
      product: (json['product'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OptionPriceMpModelToJson(OptionPriceMpModel instance) =>
    <String, dynamic>{
      'oldPrice': instance.oldPrice,
      'basePrice': instance.basePrice,
      'finalPrice': instance.finalPrice,
      'tierPrices': instance.tierPrices,
      'msrpPrice': instance.msrpPrice,
      'product': instance.product,
    };
