// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellersData _$SellersDataFromJson(Map<String, dynamic> json) => SellersData(
      logo: json['logo'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductTileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellerId: json['sellerId'],
      shopTitle: json['shopTitle'] as String?,
      shoptitle: json['shoptitle'] as String?,
      companyDescription: json['companyDescription'] as String?,
      companyLocality: json['companyLocality'] as String?,
      bannerImage: json['bannerImage'] as String?,
      productCount: json['productCount'] as String?,
    );

Map<String, dynamic> _$SellersDataToJson(SellersData instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'products': instance.products,
      'sellerId': instance.sellerId,
      'shopTitle': instance.shopTitle,
      'shoptitle': instance.shoptitle,
      'companyDescription': instance.companyDescription,
      'companyLocality': instance.companyLocality,
      'bannerImage': instance.bannerImage,
      'productCount': instance.productCount,
    };
