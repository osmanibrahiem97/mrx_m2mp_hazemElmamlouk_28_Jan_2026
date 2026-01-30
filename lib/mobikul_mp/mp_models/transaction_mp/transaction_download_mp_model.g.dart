// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_download_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDownloadMpModel _$TransactionDownloadMpModelFromJson(
        Map<String, dynamic> json) =>
    TransactionDownloadMpModel(
      url: json['url'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$TransactionDownloadMpModelToJson(
        TransactionDownloadMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'url': instance.url,
    };
