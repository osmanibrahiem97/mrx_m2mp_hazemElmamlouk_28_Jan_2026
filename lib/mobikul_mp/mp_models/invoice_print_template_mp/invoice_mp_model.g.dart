// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceMpModel _$InvoiceMpModelFromJson(Map<String, dynamic> json) =>
    InvoiceMpModel(
      headerInfo: json['headerInfo'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$InvoiceMpModelToJson(InvoiceMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'headerInfo': instance.headerInfo,
    };
