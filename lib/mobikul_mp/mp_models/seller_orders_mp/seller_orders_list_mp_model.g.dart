// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrderListMpModel _$SellerOrderListMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerOrderListMpModel(
      orderList: (json['orderList'] as List<dynamic>?)
          ?.map((e) => SellerOrderListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt()
      ..orderStatus = (json['orderStatus'] as List<dynamic>?)
          ?.map((e) => OrderStatusData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..manageOrder = json['manageOrder'] as bool?
      ..eTag = json['eTag'] as String?;

Map<String, dynamic> _$SellerOrderListMpModelToJson(
        SellerOrderListMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'cartCount': instance.cartCount,
      'orderList': instance.orderList,
      'orderStatus': instance.orderStatus,
      'totalCount': instance.totalCount,
      'manageOrder': instance.manageOrder,
      'eTag': instance.eTag,
    };

OrderStatusData _$OrderStatusDataFromJson(Map<String, dynamic> json) =>
    OrderStatusData(
      status: json['status'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$OrderStatusDataToJson(OrderStatusData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'label': instance.label,
    };

SellerOrderListData _$SellerOrderListDataFromJson(Map<String, dynamic> json) =>
    SellerOrderListData(
      status: json['status'] as String?,
      statusColorCode: json['statusColorCode'] as String?,
      orderId: json['orderId'] as String?,
      incrementId: json['incrementId'] as String?,
      productNames: (json['productNames'] as List<dynamic>?)
          ?.map((e) => ProductNamesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetailsData.fromJson(
              json['customerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SellerOrderListDataToJson(
        SellerOrderListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusColorCode': instance.statusColorCode,
      'orderId': instance.orderId,
      'incrementId': instance.incrementId,
      'productNames': instance.productNames,
      'customerDetails': instance.customerDetails,
    };

ProductNamesData _$ProductNamesDataFromJson(Map<String, dynamic> json) =>
    ProductNamesData(
      qty: (json['qty'] as num?)?.toInt(),
      name: json['name'] as String?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$ProductNamesDataToJson(ProductNamesData instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'name': instance.name,
      'productId': instance.productId,
    };

CustomerDetailsData _$CustomerDetailsDataFromJson(Map<String, dynamic> json) =>
    CustomerDetailsData(
      name: json['name'] as String?,
      date: json['date'] as String?,
      baseTotal: json['baseTotal'] as String?,
      purchaseTotal: json['purchaseTotal'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsDataToJson(
        CustomerDetailsData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'baseTotal': instance.baseTotal,
      'purchaseTotal': instance.purchaseTotal,
    };
