// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_sellers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSellersModel _$AllSellersModelFromJson(Map<String, dynamic> json) =>
    AllSellersModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      displayBanner: json['displayBanner'] as String?,
      bannerContent: json['bannerContent'] as String?,
      buttonNHeadingLabel: json['buttonNHeadingLabel'] as String?,
      bottomLabel: json['bottomLabel'] as String?,
      bannerImage: json['bannerImage'] as String?,
      topLabel: json['topLabel'] as String?,
      sellersData: (json['sellersData'] as List<dynamic>?)
          ?.map((e) => SellersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      eTag: json['eTag'] as String?,
    );

Map<String, dynamic> _$AllSellersModelToJson(AllSellersModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'displayBanner': instance.displayBanner,
      'bannerContent': instance.bannerContent,
      'buttonNHeadingLabel': instance.buttonNHeadingLabel,
      'bottomLabel': instance.bottomLabel,
      'bannerImage': instance.bannerImage,
      'topLabel': instance.topLabel,
      'sellersData': instance.sellersData,
      'eTag': instance.eTag,
    };
