// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_prices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionPrices _$OptionPricesFromJson(Map<String, dynamic> json) => OptionPrices(
      oldPrice: json['oldPrice'] == null
          ? null
          : OldPrice.fromJson(json['oldPrice'] as Map<String, dynamic>),
      basePrice: json['basePrice'] == null
          ? null
          : OldPrice.fromJson(json['basePrice'] as Map<String, dynamic>),
      finalPrice: json['finalPrice'] == null
          ? null
          : OldPrice.fromJson(json['finalPrice'] as Map<String, dynamic>),
      tierPrices: (json['tierPrices'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      msrpPrice: json['msrpPrice'] == null
          ? null
          : MsrpPrice.fromJson(json['msrpPrice'] as Map<String, dynamic>),
      product: (json['product'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OptionPricesToJson(OptionPrices instance) =>
    <String, dynamic>{
      'oldPrice': instance.oldPrice,
      'basePrice': instance.basePrice,
      'finalPrice': instance.finalPrice,
      'tierPrices': instance.tierPrices,
      'msrpPrice': instance.msrpPrice,
      'product': instance.product,
    };
