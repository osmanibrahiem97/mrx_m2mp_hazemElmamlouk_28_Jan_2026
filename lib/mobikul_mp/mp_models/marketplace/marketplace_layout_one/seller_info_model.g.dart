// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerInfoModel _$SellerInfoModelFromJson(Map<String, dynamic> json) =>
    SellerInfoModel(
      displaySellerInfo: json['displaySellerInfo'] as bool?,
      sellerId: (json['sellerId'] as num?)?.toInt(),
      shoptitle: json['shoptitle'] as String?,
      sellerRating: (json['sellerRating'] as List<dynamic>?)
          ?.map((e) => SellerRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewDescription: json['reviewDescription'] as String?,
      sellerName: json['sellerName'] as String?,
      sellerLocation: json['sellerLocation'] as String?,
      sellerProductCount: (json['sellerProductCount'] as num?)?.toInt(),
      showContactSeller: json['showContactSeller'] as bool?,
      sellerAverageRating: json['sellerAverageRating'] as String?,
    );

Map<String, dynamic> _$SellerInfoModelToJson(SellerInfoModel instance) =>
    <String, dynamic>{
      'displaySellerInfo': instance.displaySellerInfo,
      'sellerId': instance.sellerId,
      'shoptitle': instance.shoptitle,
      'sellerRating': instance.sellerRating,
      'reviewDescription': instance.reviewDescription,
      'sellerName': instance.sellerName,
      'sellerLocation': instance.sellerLocation,
      'sellerProductCount': instance.sellerProductCount,
      'showContactSeller': instance.showContactSeller,
      'sellerAverageRating': instance.sellerAverageRating,
    };
