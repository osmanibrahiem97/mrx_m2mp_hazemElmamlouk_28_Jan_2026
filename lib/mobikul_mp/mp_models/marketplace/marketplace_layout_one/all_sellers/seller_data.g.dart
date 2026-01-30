// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellersData _$SellersDataFromJson(Map<String, dynamic> json) => SellersData(
      logo: json['logo'] as String?,
      sellerId: (json['sellerId'] as num?)?.toInt(),
      shoptitle: json['shoptitle'] as String?,
      companyDescription: json['companyDescription'] as String?,
      companyLocality: json['companyLocality'] as String?,
      bannerImage: json['bannerImage'] as String?,
      productCount: json['productCount'] as String?,
    );

Map<String, dynamic> _$SellersDataToJson(SellersData instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'sellerId': instance.sellerId,
      'shoptitle': instance.shoptitle,
      'companyDescription': instance.companyDescription,
      'companyLocality': instance.companyLocality,
      'bannerImage': instance.bannerImage,
      'productCount': instance.productCount,
    };
