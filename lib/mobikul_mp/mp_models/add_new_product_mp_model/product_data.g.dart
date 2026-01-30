// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      type: json['type'] as String?,
      websiteIds: (json['websiteIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributeSetId: json['attributeSetId'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      sku: json['sku'] as String?,
      price: json['price'] as String?,
      specialPrice: json['specialPrice'] as String?,
      specialFromDate: json['specialFromDate'] as String?,
      specialToDate: json['specialToDate'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      isInStock: json['isInStock'] as bool?,
      visibility: json['visibility'] as String?,
      taxClassId: json['taxClassId'] as String?,
      productHasWeight: (json['productHasWeight'] as num?)?.toInt(),
      status: json['status'] as String?,
      isFeaturedProduct: json['isFeaturedProduct'] as String?,
      weight: json['weight'],
      metaTitle: json['metaTitle'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      metaDescription: json['metaDescription'] as String?,
      mpProductCartLimit: json['mpProductCartLimit'] as String?,
      baseImage: json['baseImage'] as String?,
      smallImage: json['smallImage'] as String?,
      swatchImage: json['swatchImage'] as String?,
      thumbnail: json['thumbnail'] as String?,
      mediaGallery: (json['mediaGallery'] as List<dynamic>?)
          ?.map((e) => MediaGallery.fromJson(e as Map<String, dynamic>))
          .toList(),
      related:
          (json['related'] as List<dynamic>?)?.map((e) => e as String).toList(),
      upsell:
          (json['upsell'] as List<dynamic>?)?.map((e) => e as String).toList(),
      crossSell: (json['crossSell'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      samplesData: (json['samplesData'] as List<dynamic>?)
          ?.map((e) => SamplesDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
      linkData: (json['linkData'] as List<dynamic>?)
          ?.map((e) => LinkData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'websiteIds': instance.websiteIds,
      'attributeSetId': instance.attributeSetId,
      'categoryIds': instance.categoryIds,
      'name': instance.name,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'sku': instance.sku,
      'price': instance.price,
      'specialPrice': instance.specialPrice,
      'specialFromDate': instance.specialFromDate,
      'specialToDate': instance.specialToDate,
      'qty': instance.qty,
      'isInStock': instance.isInStock,
      'visibility': instance.visibility,
      'taxClassId': instance.taxClassId,
      'productHasWeight': instance.productHasWeight,
      'status': instance.status,
      'isFeaturedProduct': instance.isFeaturedProduct,
      'weight': instance.weight,
      'metaTitle': instance.metaTitle,
      'metaKeyword': instance.metaKeyword,
      'metaDescription': instance.metaDescription,
      'mpProductCartLimit': instance.mpProductCartLimit,
      'baseImage': instance.baseImage,
      'smallImage': instance.smallImage,
      'swatchImage': instance.swatchImage,
      'thumbnail': instance.thumbnail,
      'mediaGallery': instance.mediaGallery,
      'related': instance.related,
      'upsell': instance.upsell,
      'crossSell': instance.crossSell,
      'samplesData': instance.samplesData,
      'linkData': instance.linkData,
    };
