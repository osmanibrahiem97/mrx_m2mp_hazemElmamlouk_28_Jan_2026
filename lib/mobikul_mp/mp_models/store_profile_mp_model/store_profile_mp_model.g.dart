// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_profile_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreProfileMpModel _$StoreProfileMpModelFromJson(Map<String, dynamic> json) =>
    StoreProfileMpModel(
      bannerImage: json['bannerImage'] as String?,
      profileImage: json['profileImage'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      shopUrl: json['shopUrl'] as String?,
      sellerId: json['sellerId'] as String?,
      location: json['location'] as String?,
      shopTitle: json['shopTitle'] as String?,
      isTwitterActive: json['isTwitterActive'] as bool?,
      twitterId: json['twitterId'] as String?,
      isFacebookActive: json['isFacebookActive'] as bool?,
      facebookId: json['facebookId'] as String?,
      isInstagramActive: json['isInstagramActive'] as bool?,
      instagramId: json['instagramId'] as String?,
      isgoogleplusActive: json['isgoogleplusActive'] as bool?,
      googleplusId: json['googleplusId'] as String?,
      isYoutubeActive: json['isYoutubeActive'] as bool?,
      youtubeId: json['youtubeId'] as String?,
      vimeoId: json['vimeoId'] as String?,
      isPinterestActive: json['isPinterestActive'] as bool?,
      orderCount: (json['orderCount'] as num?)?.toInt(),
      pinterestId: json['pinterestId'] as String?,
      description: json['description'] as String?,
      productCount: (json['productCount'] as num?)?.toInt(),
      returnPolicy: json['returnPolicy'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      shippingPolicy: json['shippingPolicy'] as String?,
      privacyPolicy: json['privacyPolicy'] as String?,
      recentProductList: (json['recentProductList'] as List<dynamic>?)
          ?.map((e) => ProductTileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackCount: json['feedbackCount'] as String?,
      price5Star: json['price5Star'] as String?,
      price4Star: json['price4Star'] as String?,
      price3Star: json['price3Star'] as String?,
      price2Star: json['price2Star'] as String?,
      price1Star: json['price1Star'] as String?,
      averagePriceRating: (json['averagePriceRating'] as num?)?.toDouble(),
      value5Star: json['value5Star'] as String?,
      value4Star: json['value4Star'] as String?,
      value3Star: json['value3Star'] as String?,
      value2Star: json['value2Star'] as String?,
      value1Star: json['value1Star'] as String?,
      averageValueRating: (json['averageValueRating'] as num?)?.toDouble(),
      quality5Star: json['quality5Star'] as String?,
      quality4Star: json['quality4Star'] as String?,
      quality3Star: json['quality3Star'] as String?,
      quality2Star: json['quality2Star'] as String?,
      quality1Star: json['quality1Star'] as String?,
      averageQualityRating: (json['averageQualityRating'] as num?)?.toDouble(),
      reviewList: (json['reviewList'] as List<dynamic>?)
          ?.map((e) => ReviewListMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      showReview: json['showReview'] as bool?,
      reportData: json['reportData'] == null
          ? null
          : ReportDataMpModel.fromJson(
              json['reportData'] as Map<String, dynamic>),
      isVimeoActive: json['isVimeoActive'] as bool?,
      isSellerPoliciesEnabled: json['is_seller_policies_enabled'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$StoreProfileMpModelToJson(
        StoreProfileMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'bannerImage': instance.bannerImage,
      'profileImage': instance.profileImage,
      'backgroundColor': instance.backgroundColor,
      'shopUrl': instance.shopUrl,
      'sellerId': instance.sellerId,
      'location': instance.location,
      'shopTitle': instance.shopTitle,
      'isTwitterActive': instance.isTwitterActive,
      'twitterId': instance.twitterId,
      'isFacebookActive': instance.isFacebookActive,
      'facebookId': instance.facebookId,
      'isInstagramActive': instance.isInstagramActive,
      'instagramId': instance.instagramId,
      'isgoogleplusActive': instance.isgoogleplusActive,
      'googleplusId': instance.googleplusId,
      'isYoutubeActive': instance.isYoutubeActive,
      'youtubeId': instance.youtubeId,
      'isVimeoActive': instance.isVimeoActive,
      'vimeoId': instance.vimeoId,
      'isPinterestActive': instance.isPinterestActive,
      'orderCount': instance.orderCount,
      'pinterestId': instance.pinterestId,
      'description': instance.description,
      'productCount': instance.productCount,
      'returnPolicy': instance.returnPolicy,
      'averageRating': instance.averageRating,
      'shippingPolicy': instance.shippingPolicy,
      'privacyPolicy': instance.privacyPolicy,
      'recentProductList': instance.recentProductList,
      'feedbackCount': instance.feedbackCount,
      'price5Star': instance.price5Star,
      'price4Star': instance.price4Star,
      'price3Star': instance.price3Star,
      'price2Star': instance.price2Star,
      'price1Star': instance.price1Star,
      'averagePriceRating': instance.averagePriceRating,
      'value5Star': instance.value5Star,
      'value4Star': instance.value4Star,
      'value3Star': instance.value3Star,
      'value2Star': instance.value2Star,
      'value1Star': instance.value1Star,
      'averageValueRating': instance.averageValueRating,
      'quality5Star': instance.quality5Star,
      'quality4Star': instance.quality4Star,
      'quality3Star': instance.quality3Star,
      'quality2Star': instance.quality2Star,
      'quality1Star': instance.quality1Star,
      'averageQualityRating': instance.averageQualityRating,
      'reviewList': instance.reviewList,
      'showReview': instance.showReview,
      'reportData': instance.reportData,
      'is_seller_policies_enabled': instance.isSellerPoliciesEnabled,
    };
