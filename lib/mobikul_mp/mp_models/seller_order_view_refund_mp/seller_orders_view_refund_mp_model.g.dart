// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_view_refund_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrdersViewRefundMpModel _$SellerOrdersViewRefundMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerOrdersViewRefundMpModel(
      buttons: (json['buttons'] as List<dynamic>?)
          ?.map((e) => ButtonsListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map(
              (e) => ViewRefundItemListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totals: (json['totals'] as List<dynamic>?)
          ?.map((e) => TotalsListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt()
      ..mainHeading = json['mainHeading'] as String?
      ..subHeading = json['subHeading'] as String?
      ..creditmemoStatus = json['creditmemoStatus'] as String?
      ..creditmemoDate = json['creditmemoDate'] as String?
      ..orderInfoHeading = json['orderInfoHeading'] as String?
      ..orderHeading = json['orderHeading'] as String?
      ..orderId = json['orderId']
      ..orderStatusHeading = json['orderStatusHeading'] as String?
      ..orderStatus = json['orderStatus'] as String?
      ..orderDateHeading = json['orderDateHeading'] as String?
      ..orderDate = json['orderDate'] as String?
      ..buyerInfoHeading = json['buyerInfoHeading'] as String?
      ..customerNameHeading = json['customerNameHeading'] as String?
      ..customerName = json['customerName'] as String?
      ..customerEmailHeading = json['customerEmailHeading'] as String?
      ..customerEmail = json['customerEmail'] as String?
      ..shippingAddress = json['shippingAddress'] as String?
      ..shippingMethod = json['shippingMethod'] as String?
      ..AddressInfoHeading = json['AddressInfoHeading'] as String?
      ..billingAddressHeading = json['billingAddressHeading'] as String?
      ..billingAddress = json['billingAddress'] as String?
      ..paymentandshippingHeading = json['paymentandshippingHeading'] as String?
      ..paymentAndShippingHeading = json['paymentAndShippingHeading'] as String?
      ..paymentMethodHeading = json['paymentMethodHeading'] as String?
      ..paymentMethod = json['paymentMethod'] as String?
      ..itemsRefundedHeading = json['itemsRefundedHeading'] as String?
      ..productNameHeading = json['productNameHeading'] as String?
      ..priceHeading = json['priceHeading'] as String?
      ..qtyHeading = json['qtyHeading'] as String?
      ..subtotalHeading = json['subtotalHeading'] as String?
      ..codChargeHeading = json['codChargeHeading'] as String?
      ..taxAmtHeading = json['taxAmtHeading'] as String?
      ..discountAmtHeading = json['discountAmtHeading'] as String?
      ..rowTotalHeading = json['rowTotalHeading'] as String?;

Map<String, dynamic> _$SellerOrdersViewRefundMpModelToJson(
        SellerOrdersViewRefundMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'mainHeading': instance.mainHeading,
      'subHeading': instance.subHeading,
      'creditmemoStatus': instance.creditmemoStatus,
      'creditmemoDate': instance.creditmemoDate,
      'buttons': instance.buttons,
      'orderInfoHeading': instance.orderInfoHeading,
      'orderHeading': instance.orderHeading,
      'orderId': instance.orderId,
      'orderStatusHeading': instance.orderStatusHeading,
      'orderStatus': instance.orderStatus,
      'orderDateHeading': instance.orderDateHeading,
      'orderDate': instance.orderDate,
      'buyerInfoHeading': instance.buyerInfoHeading,
      'customerNameHeading': instance.customerNameHeading,
      'customerName': instance.customerName,
      'customerEmailHeading': instance.customerEmailHeading,
      'customerEmail': instance.customerEmail,
      'shippingAddress': instance.shippingAddress,
      'shippingMethod': instance.shippingMethod,
      'AddressInfoHeading': instance.AddressInfoHeading,
      'billingAddressHeading': instance.billingAddressHeading,
      'billingAddress': instance.billingAddress,
      'paymentandshippingHeading': instance.paymentandshippingHeading,
      'paymentAndShippingHeading': instance.paymentAndShippingHeading,
      'paymentMethodHeading': instance.paymentMethodHeading,
      'paymentMethod': instance.paymentMethod,
      'itemsRefundedHeading': instance.itemsRefundedHeading,
      'productNameHeading': instance.productNameHeading,
      'priceHeading': instance.priceHeading,
      'qtyHeading': instance.qtyHeading,
      'subtotalHeading': instance.subtotalHeading,
      'codChargeHeading': instance.codChargeHeading,
      'taxAmtHeading': instance.taxAmtHeading,
      'discountAmtHeading': instance.discountAmtHeading,
      'rowTotalHeading': instance.rowTotalHeading,
      'itemList': instance.itemList,
      'totals': instance.totals,
    };

ButtonsListData _$ButtonsListDataFromJson(Map<String, dynamic> json) =>
    ButtonsListData(
      label: json['label'] as String?,
      title: json['title'] as String?,
      confirm: json['confirm'] as String?,
    );

Map<String, dynamic> _$ButtonsListDataToJson(ButtonsListData instance) =>
    <String, dynamic>{
      'label': instance.label,
      'title': instance.title,
      'confirm': instance.confirm,
    };

ViewRefundItemListData _$ViewRefundItemListDataFromJson(
        Map<String, dynamic> json) =>
    ViewRefundItemListData(
      productName: json['productName'] as String?,
      subTotal: json['subTotal'] as String?,
      rowTotal: json['rowTotal'] as String?,
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
      ..qty = json['qty']
      ..totalTax = json['totalTax'] as String?
      ..discountTotal = json['discountTotal'] as String?;

Map<String, dynamic> _$ViewRefundItemListDataToJson(
        ViewRefundItemListData instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'customOption': instance.customOption,
      'downloadableOptionLable': instance.downloadableOptionLable,
      'downloadableOptionValue': instance.downloadableOptionValue,
      'sku': instance.sku,
      'price': instance.price,
      'qty': instance.qty,
      'subTotal': instance.subTotal,
      'totalTax': instance.totalTax,
      'discountTotal': instance.discountTotal,
      'rowTotal': instance.rowTotal,
    };

TotalsListData _$TotalsListDataFromJson(Map<String, dynamic> json) =>
    TotalsListData(
      code: json['code'] as String?,
      label: json['label'] as String?,
      value: json['value'] as String?,
      formattedValue: json['formattedValue'] as String?,
    );

Map<String, dynamic> _$TotalsListDataToJson(TotalsListData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'formattedValue': instance.formattedValue,
    };
