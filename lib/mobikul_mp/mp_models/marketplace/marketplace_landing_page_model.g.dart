// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_landing_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketplaceLandingPageModel _$MarketplaceLandingPageModelFromJson(
        Map<String, dynamic> json) =>
    MarketplaceLandingPageModel(
      pageLayout: json['pageLayout'] as String?,
      layout1: json['layout1'] == null
          ? null
          : Layout1.fromJson(json['layout1'] as Map<String, dynamic>),
      layout2: json['layout2'] == null
          ? null
          : Layout2.fromJson(json['layout2'] as Map<String, dynamic>),
      layout3: json['layout3'] == null
          ? null
          : Layout3.fromJson(json['layout3'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$MarketplaceLandingPageModelToJson(
        MarketplaceLandingPageModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'pageLayout': instance.pageLayout,
      'layout1': instance.layout1,
      'layout2': instance.layout2,
      'layout3': instance.layout3,
    };
