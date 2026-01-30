// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesMpModel _$PricesMpModelFromJson(Map<String, dynamic> json) =>
    PricesMpModel(
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
    );

Map<String, dynamic> _$PricesMpModelToJson(PricesMpModel instance) =>
    <String, dynamic>{
      'oldPrice': instance.oldPrice,
      'basePrice': instance.basePrice,
      'finalPrice': instance.finalPrice,
    };
