// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_details_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrderDetailsMpModel _$SellerOrderDetailsMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerOrderDetailsMpModel(
      json['invoiceIncrement'] as String?,
      json['shipmentIncrement'] as String?,
      json['orderData'] == null
          ? null
          : SellerOrderData.fromJson(json['orderData'] as Map<String, dynamic>),
      json['statusLabel'] as String?,
      json['incrementId'] as String?,
      json['orderDate'] as String?,
      json['orderTotal'] as String?,
      json['state'] as String?,
      json['invoiceId'] as String?,
      json['shipmentId'] as String?,
      json['shippingAddress'] as String?,
      json['manageOrder'] as bool?,
      json['cancelButton'] as bool?,
      json['invoiceButton'] as bool?,
      json['sendEmailButton'] as bool?,
      json['creditMemoButton'] as bool?,
      json['showBuyerInformation'],
      json['buyerName'] as String?,
      json['buyerEmail'],
      json['showAddressInformation'],
      json['billingAddress'],
      json['shippingMethod'] as String?,
      json['subHeading'] as String?,
      json['mainHeading'] as String?,
      json['statusHeading'] as String?,
      json['amountHeading'] as String?,
      json['actionHeading'] as String?,
      json['createdAtHeading'] as String?,
      json['creditMemoIdHeading'] as String?,
      (json['creditMemoList'] as List<dynamic>?)
          ?.map((e) => CreditMemoListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['eTag'] as String?,
      json['paymentMethod'] as String?,
      json['shipmentButton'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt()
      ..creditMemoTab = json['creditMemoTab'] as bool?;

Map<String, dynamic> _$SellerOrderDetailsMpModelToJson(
        SellerOrderDetailsMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'cartCount': instance.cartCount,
      'invoiceIncrement': instance.invoiceIncrement,
      'shipmentIncrement': instance.shipmentIncrement,
      'orderData': instance.orderData,
      'statusLabel': instance.statusLabel,
      'incrementId': instance.incrementId,
      'orderDate': instance.orderDate,
      'orderTotal': instance.orderTotal,
      'state': instance.state,
      'invoiceId': instance.invoiceId,
      'shipmentId': instance.shipmentId,
      'shippingAddress': instance.shippingAddress,
      'manageOrder': instance.manageOrder,
      'cancelButton': instance.cancelButton,
      'invoiceButton': instance.invoiceButton,
      'sendEmailButton': instance.sendEmailButton,
      'creditMemoTab': instance.creditMemoTab,
      'creditMemoButton': instance.creditMemoButton,
      'showBuyerInformation': instance.showBuyerInformation,
      'buyerName': instance.buyerName,
      'buyerEmail': instance.buyerEmail,
      'showAddressInformation': instance.showAddressInformation,
      'billingAddress': instance.billingAddress,
      'shippingMethod': instance.shippingMethod,
      'subHeading': instance.subHeading,
      'mainHeading': instance.mainHeading,
      'statusHeading': instance.statusHeading,
      'amountHeading': instance.amountHeading,
      'actionHeading': instance.actionHeading,
      'createdAtHeading': instance.createdAtHeading,
      'creditMemoIdHeading': instance.creditMemoIdHeading,
      'creditMemoList': instance.creditMemoList,
      'eTag': instance.eTag,
      'paymentMethod': instance.paymentMethod,
      'shipmentButton': instance.shipmentButton,
    };

CreditMemoListData _$CreditMemoListDataFromJson(Map<String, dynamic> json) =>
    CreditMemoListData(
      entityId: json['entityId'] as String?,
      incrementId: json['incrementId'] as String?,
      billToName: json['billToName'] as String?,
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$CreditMemoListDataToJson(CreditMemoListData instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'incrementId': instance.incrementId,
      'billToName': instance.billToName,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'amount': instance.amount,
    };

SellerOrderData _$SellerOrderDataFromJson(Map<String, dynamic> json) =>
    SellerOrderData(
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => SellerItemListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totals: (json['totals'] as List<dynamic>?)
          ?.map((e) => SellerTotalsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerOrderDataToJson(SellerOrderData instance) =>
    <String, dynamic>{
      'itemList': instance.itemList,
      'totals': instance.totals,
    };

SellerItemListData _$SellerItemListDataFromJson(Map<String, dynamic> json) =>
    SellerItemListData(
      json['sellerItemCost'] as String?,
      json['formattedSellerItemCost'] as String?,
      json['totalTaxPerItem'] as String?,
      json['formattedTotalTaxPerItem'] as String?,
      json['adminItemCommission'] as String?,
      json['formattedAdminItemCommission'] as String?,
      json['name'] as String?,
      json['productId'] as String?,
      json['option'] == null
          ? null
          : OptionLabeldata.fromJson(json['option'] as Map<String, dynamic>),
      json['sku'] as String?,
      json['price'] as String?,
      json['qty'] == null
          ? null
          : SellerQtyData.fromJson(json['qty'] as Map<String, dynamic>),
      json['subTotal'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$SellerItemListDataToJson(SellerItemListData instance) =>
    <String, dynamic>{
      'sellerItemCost': instance.sellerItemCost,
      'formattedSellerItemCost': instance.formattedSellerItemCost,
      'totalTaxPerItem': instance.totalTaxPerItem,
      'formattedTotalTaxPerItem': instance.formattedTotalTaxPerItem,
      'adminItemCommission': instance.adminItemCommission,
      'formattedAdminItemCommission': instance.formattedAdminItemCommission,
      'name': instance.name,
      'productId': instance.productId,
      'option': instance.option,
      'sku': instance.sku,
      'price': instance.price,
      'qty': instance.qty,
      'subTotal': instance.subTotal,
      'image': instance.image,
    };

SellerQtyData _$SellerQtyDataFromJson(Map<String, dynamic> json) =>
    SellerQtyData(
      Ordered: (json['Ordered'] as num?)?.toInt(),
      Shipped: (json['Shipped'] as num?)?.toInt(),
      Canceled: (json['Canceled'] as num?)?.toInt(),
      Refunded: (json['Refunded'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SellerQtyDataToJson(SellerQtyData instance) =>
    <String, dynamic>{
      'Ordered': instance.Ordered,
      'Shipped': instance.Shipped,
      'Canceled': instance.Canceled,
      'Refunded': instance.Refunded,
    };

SellerTotalsData _$SellerTotalsDataFromJson(Map<String, dynamic> json) =>
    SellerTotalsData(
      code: json['code'],
      label: json['label'],
      value: json['value'],
      formattedValue: json['formattedValue'],
    );

Map<String, dynamic> _$SellerTotalsDataToJson(SellerTotalsData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'formattedValue': instance.formattedValue,
    };

OptionLabeldata _$OptionLabeldataFromJson(Map<String, dynamic> json) =>
    OptionLabeldata(
      label: json['label'],
      value: json['value'],
    );

Map<String, dynamic> _$OptionLabeldataToJson(OptionLabeldata instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
