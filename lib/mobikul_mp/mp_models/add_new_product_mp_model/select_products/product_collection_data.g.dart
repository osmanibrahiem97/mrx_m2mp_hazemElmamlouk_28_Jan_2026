// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_collection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCollectionData _$ProductCollectionDataFromJson(
        Map<String, dynamic> json) =>
    ProductCollectionData(
      selected: json['selected'] as bool?,
      entity_id: (json['entity_id'] as num?)?.toInt(),
      thumbnail: json['thumbnail'] as String?,
      name: json['name'] as String?,
      attrinuteSet: json['attrinuteSet'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      sku: json['sku'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$ProductCollectionDataToJson(
        ProductCollectionData instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'entity_id': instance.entity_id,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
      'attrinuteSet': instance.attrinuteSet,
      'status': instance.status,
      'type': instance.type,
      'sku': instance.sku,
      'price': instance.price,
    };
