// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_menu_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerMenuData _$SellerMenuDataFromJson(Map<String, dynamic> json) =>
    SellerMenuData(
      sellermenu: (json['menus'] as List<dynamic>?)
          ?.map((e) => SellerMenuList.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerMenuDataToJson(SellerMenuData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'menus': instance.sellermenu,
    };
