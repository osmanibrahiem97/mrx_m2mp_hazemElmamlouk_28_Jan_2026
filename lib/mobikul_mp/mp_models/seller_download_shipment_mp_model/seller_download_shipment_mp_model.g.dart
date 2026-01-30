// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_download_shipment_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerDownloadShipmentMpModel _$SellerDownloadShipmentMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerDownloadShipmentMpModel(
      json['url'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerDownloadShipmentMpModelToJson(
        SellerDownloadShipmentMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'url': instance.url,
    };
