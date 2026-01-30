// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_names_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductNamesMpModel _$ProductNamesMpModelFromJson(Map<String, dynamic> json) =>
    ProductNamesMpModel(
      qty: (json['qty'] as num?)?.toInt(),
      name: json['name'] as String?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$ProductNamesMpModelToJson(
        ProductNamesMpModel instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'name': instance.name,
      'productId': instance.productId,
    };
