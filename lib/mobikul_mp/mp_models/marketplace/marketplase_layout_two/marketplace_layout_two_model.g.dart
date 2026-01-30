// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_layout_two_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketplaceLayoutTwoModel _$MarketplaceLayoutTwoModelFromJson(
        Map<String, dynamic> json) =>
    MarketplaceLayoutTwoModel(
      pageLayout: json['pageLayout'] as String?,
      layout2: json['layout2'] == null
          ? null
          : Layout2.fromJson(json['layout2'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$MarketplaceLayoutTwoModelToJson(
        MarketplaceLayoutTwoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'pageLayout': instance.pageLayout,
      'layout2': instance.layout2,
    };
