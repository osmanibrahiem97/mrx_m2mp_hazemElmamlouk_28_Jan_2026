// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_products_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerProductsListMpModel _$SellerProductsListMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerProductsListMpModel(
      productList: (json['productList'] as List<dynamic>?)
          ?.map(
              (e) => SellerProductListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerProductsListMpModelToJson(
        SellerProductsListMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'productList': instance.productList,
      'totalCount': instance.totalCount,
    };

SellerProductListData _$SellerProductListDataFromJson(
        Map<String, dynamic> json) =>
    SellerProductListData(
      productId: json['productId'] as String?,
      image: json['image'] as String?,
      openable: json['openable'] as bool?,
      productPrice: json['productPrice'] as String?,
      name: json['name'] as String?,
      productType: json['productType'] as String?,
      sku: json['sku'] as String?,
      specialPrice: json['specialPrice'] as String?,
      specialFromDate: json['specialFromDate'] as String?,
      taxClassId: json['taxClassId'] as String?,
      specialToDate: json['specialToDate'] as String?,
      status: json['status'] as String?,
      qtySold: json['qtySold'] as String?,
      qtyPending: json['qtyPending'] as String?,
      qtyConfirmed: json['qtyConfirmed'] as String?,
      earnedAmount: json['earnedAmount'] as String?,
    );

Map<String, dynamic> _$SellerProductListDataToJson(
        SellerProductListData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'image': instance.image,
      'openable': instance.openable,
      'productPrice': instance.productPrice,
      'name': instance.name,
      'productType': instance.productType,
      'sku': instance.sku,
      'specialPrice': instance.specialPrice,
      'specialFromDate': instance.specialFromDate,
      'taxClassId': instance.taxClassId,
      'specialToDate': instance.specialToDate,
      'status': instance.status,
      'qtySold': instance.qtySold,
      'qtyPending': instance.qtyPending,
      'qtyConfirmed': instance.qtyConfirmed,
      'earnedAmount': instance.earnedAmount,
    };
