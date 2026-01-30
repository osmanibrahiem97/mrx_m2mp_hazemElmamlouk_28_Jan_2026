// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      oldPrice: json['oldPrice'] == null
          ? null
          : OldPrice.fromJson(json['oldPrice'] as Map<String, dynamic>),
      basePrice: json['basePrice'] == null
          ? null
          : OldPrice.fromJson(json['basePrice'] as Map<String, dynamic>),
      finalPrice: json['finalPrice'] == null
          ? null
          : OldPrice.fromJson(json['finalPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'oldPrice': instance.oldPrice,
      'basePrice': instance.basePrice,
      'finalPrice': instance.finalPrice,
    };
