// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerListMpModel _$SellerListMpModelFromJson(Map<String, dynamic> json) =>
    SellerListMpModel(
      sellerList: (json['sellerList'] as List<dynamic>?)
          ?.map((e) => SellerListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      apiKey: json['apiKey'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerListMpModelToJson(SellerListMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'apiKey': instance.apiKey,
      'sellerList': instance.sellerList,
    };

SellerListData _$SellerListDataFromJson(Map<String, dynamic> json) =>
    SellerListData(
      name: json['name'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      customerToken: json['customerToken'] as String?,
      profileImage: json['profileImage'] as String?,
      token: json['token'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SellerListDataToJson(SellerListData instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerToken': instance.customerToken,
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
      'profileImage': instance.profileImage,
    };
