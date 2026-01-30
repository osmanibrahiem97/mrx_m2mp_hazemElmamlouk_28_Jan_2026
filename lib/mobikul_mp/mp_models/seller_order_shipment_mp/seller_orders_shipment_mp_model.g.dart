// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_shipment_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrdersShipmentMpModel _$SellerOrdersShipmentMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerOrdersShipmentMpModel(
      actionButtons: (json['actionButtons'] as List<dynamic>?)
          ?.map(
              (e) => ActionButtonsListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => ShipmentItemListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderTotal: json['orderTotal'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt()
      ..mainHeading = json['mainHeading'] as String?
      ..subHeading = json['subHeading'] as String?
      ..shipmentIncrementedId = json['shipmentIncrementedId'] as String?
      ..shipmentDate = json['shipmentDate'] as String?
      ..orderInfoHeading = json['orderInfoHeading'] as String?
      ..orderHeading = json['orderHeading'] as String?
      ..orderIncrementedId = json['orderIncrementedId'] as String?
      ..orderStatusHeading = json['orderStatusHeading'] as String?
      ..orderStatus = json['orderStatus'] as String?
      ..orderDateHeading = json['orderDateHeading'] as String?
      ..orderDate = json['orderDate'] as String?
      ..showBuyerInformation = json['showBuyerInformation'] as bool?
      ..buyerInfoHeading = json['buyerInfoHeading'] as String?
      ..customerNameHeading = json['customerNameHeading'] as String?
      ..customerName = json['customerName'] as String?
      ..customerEmailHeading = json['customerEmailHeading'] as String?
      ..customerEmail = json['customerEmail'] as String?
      ..State = json['State'] as String?
      ..StatusColorCode = json['StatusColorCode'] as String?
      ..addressinfoHeading = json['addressinfoHeading'] as String?
      ..showAddressInformation = json['showAddressInformation'] as bool?
      ..billingAddressHeading = json['billingAddressHeading'] as String?
      ..billingAddress = json['billingAddress'] as String?
      ..shippingAddressHeading = json['shippingAddressHeading'] as String?
      ..shippingAddress = json['shippingAddress'] as String?
      ..paymentAndShippingHeading = json['paymentAndShippingHeading'] as String?
      ..paymentMethod = json['paymentMethod'] as String?
      ..shippingInfoHeading = json['shippingInfoHeading'] as String?
      ..shippingMethod = json['shippingMethod'] as String?
      ..itemShippedHeading = json['itemShippedHeading'] as String?
      ..subTotal = json['subTotal'] as String?
      ..shipping = json['shipping'] as String?
      ..discount = json['discount'] as String?
      ..tax = json['tax'] as String?
      ..mpcodcharge = json['mpcodcharge'] as String?
      ..orderBaseTotal = json['orderBaseTotal'] as String?
      ..vendorTotal = json['vendorTotal'] as String?
      ..vendorBaseTotal = json['vendorBaseTotal'] as String?
      ..adminCommission = json['adminCommission'] as String?
      ..adminBaseCommission = json['adminBaseCommission'] as String?
      ..eTag = json['eTag'] as String?;

Map<String, dynamic> _$SellerOrdersShipmentMpModelToJson(
        SellerOrdersShipmentMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'cartCount': instance.cartCount,
      'mainHeading': instance.mainHeading,
      'subHeading': instance.subHeading,
      'shipmentIncrementedId': instance.shipmentIncrementedId,
      'shipmentDate': instance.shipmentDate,
      'actionButtons': instance.actionButtons,
      'orderInfoHeading': instance.orderInfoHeading,
      'orderHeading': instance.orderHeading,
      'orderIncrementedId': instance.orderIncrementedId,
      'orderStatusHeading': instance.orderStatusHeading,
      'orderStatus': instance.orderStatus,
      'orderDateHeading': instance.orderDateHeading,
      'orderDate': instance.orderDate,
      'showBuyerInformation': instance.showBuyerInformation,
      'buyerInfoHeading': instance.buyerInfoHeading,
      'customerNameHeading': instance.customerNameHeading,
      'customerName': instance.customerName,
      'customerEmailHeading': instance.customerEmailHeading,
      'customerEmail': instance.customerEmail,
      'State': instance.State,
      'StatusColorCode': instance.StatusColorCode,
      'addressinfoHeading': instance.addressinfoHeading,
      'showAddressInformation': instance.showAddressInformation,
      'billingAddressHeading': instance.billingAddressHeading,
      'billingAddress': instance.billingAddress,
      'shippingAddressHeading': instance.shippingAddressHeading,
      'shippingAddress': instance.shippingAddress,
      'paymentAndShippingHeading': instance.paymentAndShippingHeading,
      'paymentMethod': instance.paymentMethod,
      'shippingInfoHeading': instance.shippingInfoHeading,
      'shippingMethod': instance.shippingMethod,
      'itemShippedHeading': instance.itemShippedHeading,
      'itemList': instance.itemList,
      'subTotal': instance.subTotal,
      'shipping': instance.shipping,
      'discount': instance.discount,
      'tax': instance.tax,
      'mpcodcharge': instance.mpcodcharge,
      'orderTotal': instance.orderTotal,
      'orderBaseTotal': instance.orderBaseTotal,
      'vendorTotal': instance.vendorTotal,
      'vendorBaseTotal': instance.vendorBaseTotal,
      'adminCommission': instance.adminCommission,
      'adminBaseCommission': instance.adminBaseCommission,
      'eTag': instance.eTag,
    };

ActionButtonsListData _$ActionButtonsListDataFromJson(
        Map<String, dynamic> json) =>
    ActionButtonsListData(
      label: json['label'] as String?,
      title: json['title'] as String?,
      confirmMsg: json['confirmMsg'] as String?,
    );

Map<String, dynamic> _$ActionButtonsListDataToJson(
        ActionButtonsListData instance) =>
    <String, dynamic>{
      'label': instance.label,
      'title': instance.title,
      'confirmMsg': instance.confirmMsg,
    };

ShipmentItemListData _$ShipmentItemListDataFromJson(
        Map<String, dynamic> json) =>
    ShipmentItemListData(
      productName: json['productName'] as String?,
      totalPrice: json['totalPrice'] as String?,
      vendorTotal: json['vendorTotal'] as String?,
    )
      ..customOption = (json['customOption'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..downloadableOptionLable = json['downloadableOptionLable'] as String?
      ..downloadableOptionValue =
          (json['downloadableOptionValue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..sku = json['sku'] as String?
      ..price = json['price'] as String?
      ..qty = (json['qty'] as List<dynamic>?)
          ?.map((e) => Qty.fromJson(e as Map<String, dynamic>))
          .toList()
      ..mpcodprice = json['mpcodprice'] as String?
      ..adminCommission = json['adminCommission'] as String?;

Map<String, dynamic> _$ShipmentItemListDataToJson(
        ShipmentItemListData instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'customOption': instance.customOption,
      'downloadableOptionLable': instance.downloadableOptionLable,
      'downloadableOptionValue': instance.downloadableOptionValue,
      'sku': instance.sku,
      'price': instance.price,
      'qty': instance.qty,
      'totalPrice': instance.totalPrice,
      'mpcodprice': instance.mpcodprice,
      'adminCommission': instance.adminCommission,
      'vendorTotal': instance.vendorTotal,
    };

Qty _$QtyFromJson(Map<String, dynamic> json) => Qty(
      label: json['label'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QtyToJson(Qty instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
