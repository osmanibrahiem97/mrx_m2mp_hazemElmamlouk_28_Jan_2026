// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_invoice_screen_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerInvoiceScreenMpModel _$SellerInvoiceScreenMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerInvoiceScreenMpModel(
      json['mainHeading'] as String?,
      json['subHeading'] as String?,
      json['invoiceStatus'] as String?,
      json['invoiceDate'] as String?,
      (json['actionButtons'] as List<dynamic>?)
          ?.map((e) => ActionButtonsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['orderInfoHeading'] as String?,
      json['orderHeading'] as String?,
      json['orderStatusHeading'] as String?,
      json['orderStatus'] as String?,
      json['orderDateHeading'] as String?,
      json['orderDate'] as String?,
      json['showBuyerInformation'] as bool?,
      json['buyerInfoHeading'] as String?,
      json['customerNameHeading'] as String?,
      json['customerName'] as String?,
      json['customerEmailHeading'] as String?,
      json['customerEmail'] as String?,
      json['State'] as String?,
      json['StatusColorCode'] as String?,
      json['addressinfoHeading'] as String?,
      json['showAddressInformation'],
      json['billingAddressHeading'] as String?,
      json['billingAddress'] as String?,
      json['paymentAndShippingHeading'] as String?,
      json['paymentInfoHeading'] as String?,
      json['paymentMethod'] as String?,
      json['itemInvoicedHeading'] as String?,
      (json['itemList'] as List<dynamic>?)
          ?.map((e) => InvoiceItemListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totals'] as List<dynamic>?)
          ?.map((e) => InvoiceTotalsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cartTotal'] as String?,
      json['adminTotalTax'] as List<dynamic>?,
      json['vendorTotalTax'] as List<dynamic>?,
      json['eTag'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerInvoiceScreenMpModelToJson(
        SellerInvoiceScreenMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'cartCount': instance.cartCount,
      'mainHeading': instance.mainHeading,
      'subHeading': instance.subHeading,
      'invoiceStatus': instance.invoiceStatus,
      'invoiceDate': instance.invoiceDate,
      'actionButtons': instance.actionButtons,
      'orderInfoHeading': instance.orderInfoHeading,
      'orderHeading': instance.orderHeading,
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
      'paymentAndShippingHeading': instance.paymentAndShippingHeading,
      'paymentInfoHeading': instance.paymentInfoHeading,
      'paymentMethod': instance.paymentMethod,
      'itemInvoicedHeading': instance.itemInvoicedHeading,
      'itemList': instance.itemList,
      'totals': instance.totals,
      'cartTotal': instance.cartTotal,
      'adminTotalTax': instance.adminTotalTax,
      'vendorTotalTax': instance.vendorTotalTax,
      'eTag': instance.eTag,
    };

ActionButtonsModel _$ActionButtonsModelFromJson(Map<String, dynamic> json) =>
    ActionButtonsModel(
      label: json['label'] as String?,
      title: json['title'] as String?,
      confirmMsg: json['confirmMsg'] as String?,
    );

Map<String, dynamic> _$ActionButtonsModelToJson(ActionButtonsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'title': instance.title,
      'confirmMsg': instance.confirmMsg,
    };

InvoiceItemListModel _$InvoiceItemListModelFromJson(
        Map<String, dynamic> json) =>
    InvoiceItemListModel(
      productName: json['productName'] as String?,
      customOption: (json['customOption'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      downloadableOptionLable: json['downloadableOptionLable'] as String?,
      downloadableOptionValue:
          (json['downloadableOptionValue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      sku: json['sku'] as String?,
      price: json['price'] as String?,
      qty: (json['qty'] as List<dynamic>?)
          ?.map((e) => SellerQtyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: json['totalPrice'] as String?,
      mpcodprice: json['mpcodprice'] as String?,
      adminCommission: json['adminCommission'] as String?,
      vendorTotal: json['vendorTotal'] as String?,
      subTotal: json['subTotal'] as String?,
    );

Map<String, dynamic> _$InvoiceItemListModelToJson(
        InvoiceItemListModel instance) =>
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
      'subTotal': instance.subTotal,
    };

SellerQtyDataModel _$SellerQtyDataModelFromJson(Map<String, dynamic> json) =>
    SellerQtyDataModel(
      label: json['label'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SellerQtyDataModelToJson(SellerQtyDataModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

InvoiceTotalsModel _$InvoiceTotalsModelFromJson(Map<String, dynamic> json) =>
    InvoiceTotalsModel(
      code: json['code'] as String?,
      label: json['label'] as String?,
      value: json['value'] as String?,
      formattedValue: json['formattedValue'] as String?,
    );

Map<String, dynamic> _$InvoiceTotalsModelToJson(InvoiceTotalsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'formattedValue': instance.formattedValue,
    };
