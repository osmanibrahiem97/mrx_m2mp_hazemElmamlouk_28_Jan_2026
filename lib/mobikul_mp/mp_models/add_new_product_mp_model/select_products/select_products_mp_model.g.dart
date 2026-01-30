// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_products_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectProductsMpModel _$SelectProductsMpModelFromJson(
        Map<String, dynamic> json) =>
    SelectProductsMpModel(
      filterOption: (json['filterOption'] as List<dynamic>?)
          ?.map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      productCollectionData: (json['productCollectionData'] as List<dynamic>?)
          ?.map(
              (e) => ProductCollectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SelectProductsMpModelToJson(
        SelectProductsMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'filterOption': instance.filterOption,
      'totalCount': instance.totalCount,
      'productCollectionData': instance.productCollectionData,
    };
