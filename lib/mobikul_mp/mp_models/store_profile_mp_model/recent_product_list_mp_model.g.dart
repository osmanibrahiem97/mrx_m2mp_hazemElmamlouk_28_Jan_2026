// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_product_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentProductListMpModel _$RecentProductListMpModelFromJson(
        Map<String, dynamic> json) =>
    RecentProductListMpModel(
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      isInWishlist: json['isInWishlist'] as bool?,
      wishlistItemId: (json['wishlistItemId'] as num?)?.toInt(),
      typeId: json['typeId'] as String?,
      entityId: json['entityId'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      isAvailable: json['isAvailable'] as bool?,
      price: (json['price'] as num?)?.toInt(),
      finalPrice: (json['finalPrice'] as num?)?.toInt(),
      formattedPrice: json['formattedPrice'] as String?,
      formattedFinalPrice: json['formattedFinalPrice'] as String?,
      name: json['name'] as String?,
      hasRequiredOptions: json['hasRequiredOptions'] as bool?,
      isNew: json['isNew'] as bool?,
      isInRange: json['isInRange'] as bool?,
      thumbNail: json['thumbNail'] as String?,
      dominantColor: json['dominantColor'] as String?,
      tierPrice: json['tierPrice'] as String?,
      formattedTierPrice: json['formattedTierPrice'] as String?,
      minAddToCartQty: (json['minAddToCartQty'] as num?)?.toInt(),
      availability: json['availability'] as String?,
      arUrl: json['arUrl'] as String?,
      arType: json['arType'] as String?,
    );

Map<String, dynamic> _$RecentProductListMpModelToJson(
        RecentProductListMpModel instance) =>
    <String, dynamic>{
      'reviewCount': instance.reviewCount,
      'isInWishlist': instance.isInWishlist,
      'wishlistItemId': instance.wishlistItemId,
      'typeId': instance.typeId,
      'entityId': instance.entityId,
      'rating': instance.rating,
      'isAvailable': instance.isAvailable,
      'price': instance.price,
      'finalPrice': instance.finalPrice,
      'formattedPrice': instance.formattedPrice,
      'formattedFinalPrice': instance.formattedFinalPrice,
      'name': instance.name,
      'hasRequiredOptions': instance.hasRequiredOptions,
      'isNew': instance.isNew,
      'isInRange': instance.isInRange,
      'thumbNail': instance.thumbNail,
      'dominantColor': instance.dominantColor,
      'tierPrice': instance.tierPrice,
      'formattedTierPrice': instance.formattedTierPrice,
      'minAddToCartQty': instance.minAddToCartQty,
      'availability': instance.availability,
      'arUrl': instance.arUrl,
      'arType': instance.arType,
    };
