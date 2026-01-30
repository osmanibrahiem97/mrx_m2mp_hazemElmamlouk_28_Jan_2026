// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerRating _$SellerRatingFromJson(Map<String, dynamic> json) => SellerRating(
      label: json['label'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SellerRatingToJson(SellerRating instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
