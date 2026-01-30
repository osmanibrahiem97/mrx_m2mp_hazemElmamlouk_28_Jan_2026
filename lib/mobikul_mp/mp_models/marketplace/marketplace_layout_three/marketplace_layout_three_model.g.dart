// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_layout_three_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketplaceLayoutThreeModel _$MarketplaceLayoutThreeModelFromJson(
        Map<String, dynamic> json) =>
    MarketplaceLayoutThreeModel(
      pageLayout: json['pageLayout'] as String?,
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

Map<String, dynamic> _$MarketplaceLayoutThreeModelToJson(
        MarketplaceLayoutThreeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'pageLayout': instance.pageLayout,
      'layout3': instance.layout3,
    };
