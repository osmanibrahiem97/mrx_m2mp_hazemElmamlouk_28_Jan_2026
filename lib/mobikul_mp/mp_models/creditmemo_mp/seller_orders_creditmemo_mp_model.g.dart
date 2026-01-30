// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orders_creditmemo_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerOrdersCreditmemoMpModel _$SellerOrdersCreditmemoMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerOrdersCreditmemoMpModel(
      json['mainHeading'] as String?,
      json['subHeading'] as String?,
      json['status'] as String?,
      json['orderDate'] as String?,
      json['buyerInfoHeading'] as String?,
      json['customerNameHeading'] as String?,
      json['customerName'] as String?,
      json['customerEmailHeading'] as String?,
      json['customerEmail'] as String?,
      json['orderInfoHeading'] as String?,
      json['paymentMethodHeading'] as String?,
      json['paymentMethod'] as String?,
      json['itemsRefundHeading'] as String?,
      json['itemsProductNameHeading'] as String?,
      json['itemsPiceHeading'] as String?,
      json['itemsQtyHeading'] as String?,
      json['itemsReturnToStockHeading'] as String?,
      json['itemsQtyToRefundHeading'] as String?,
      json['itemsSubtotalHeading'] as String?,
      json['itemsCodHeading'] as String?,
      json['itemsTaxAmtHeading'] as String?,
      json['itemsDiscountAmtHeading'] as String?,
      json['itemsRowTotalHeading'] as String?,
      (json['itemList'] as List<dynamic>?)
          ?.map((e) =>
              NewCreditMemoItemListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['paidAmountHeading'] as String?,
      json['refundAmountHeading'] as String?,
      json['shippingAmountHeading'] as String?,
      json['shippingRefundHeading'] as String?,
      json['orderGrandTotalHeading'] as String?,
      json['paidAmount'] as String?,
      json['refundAmount'] as String?,
      json['shippingAmount'] as String?,
      json['shippingRefund'] as String?,
      json['orderGrandTotal'] as String?,
      json['creditMemoCommentHeading'] as String?,
      json['refundTotalHeading'] as String?,
      json['subtotalHeading'] as String?,
      json['subTotal'] as String?,
      json['discountHeading'] as String?,
      json['discount'] as String?,
      json['totalTaxHeading'] as String?,
      json['totalTax'] as String?,
      json['refundShippingHeading'] as String?,
      json['adjustmentRefundHeading'] as String?,
      json['adjustmentFeeHeading'] as String?,
      json['grandTotalHeading'] as String?,
      json['grandTotal'] as String?,
      json['invoiceId'] as String?,
      json['appendCommentsHeading'] as String?,
      json['visibleOnFrontendHeading'] as String?,
      json['emailCopyHeading'] as String?,
      json['refundOnlineButtonHeading'] as String?,
      json['refundOfflineButtonHeading'] as String?,
      json['refundOnlineEnableFlag'] as bool?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt()
      ..billingAddress = json['billingAddress'] as String?
      ..refundShipping = json['refundShipping'] as String?
      ..adjustmentRefund = json['adjustmentRefund'] as String?
      ..adjustmentFee = json['adjustmentFee'] as String?
      ..isAppendCommentsChecked = json['isAppendCommentsChecked'] as bool?
      ..isVisibleOnFrontendChecked = json['isVisibleOnFrontendChecked'] as bool?
      ..isEmailCopyOfCreditMemoChecked =
          json['isEmailCopyOfCreditMemoChecked'] as bool?;

Map<String, dynamic> _$SellerOrdersCreditmemoMpModelToJson(
        SellerOrdersCreditmemoMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'mainHeading': instance.mainHeading,
      'subHeading': instance.subHeading,
      'status': instance.status,
      'orderDate': instance.orderDate,
      'buyerInfoHeading': instance.buyerInfoHeading,
      'customerNameHeading': instance.customerNameHeading,
      'customerName': instance.customerName,
      'customerEmailHeading': instance.customerEmailHeading,
      'customerEmail': instance.customerEmail,
      'orderInfoHeading': instance.orderInfoHeading,
      'paymentMethodHeading': instance.paymentMethodHeading,
      'billingAddress': instance.billingAddress,
      'paymentMethod': instance.paymentMethod,
      'itemsRefundHeading': instance.itemsRefundHeading,
      'itemsProductNameHeading': instance.itemsProductNameHeading,
      'itemsPiceHeading': instance.itemsPiceHeading,
      'itemsQtyHeading': instance.itemsQtyHeading,
      'itemsReturnToStockHeading': instance.itemsReturnToStockHeading,
      'itemsQtyToRefundHeading': instance.itemsQtyToRefundHeading,
      'itemsSubtotalHeading': instance.itemsSubtotalHeading,
      'itemsCodHeading': instance.itemsCodHeading,
      'itemsTaxAmtHeading': instance.itemsTaxAmtHeading,
      'itemsDiscountAmtHeading': instance.itemsDiscountAmtHeading,
      'itemsRowTotalHeading': instance.itemsRowTotalHeading,
      'itemList': instance.itemList,
      'paidAmountHeading': instance.paidAmountHeading,
      'refundAmountHeading': instance.refundAmountHeading,
      'shippingAmountHeading': instance.shippingAmountHeading,
      'shippingRefundHeading': instance.shippingRefundHeading,
      'orderGrandTotalHeading': instance.orderGrandTotalHeading,
      'paidAmount': instance.paidAmount,
      'refundAmount': instance.refundAmount,
      'shippingAmount': instance.shippingAmount,
      'shippingRefund': instance.shippingRefund,
      'orderGrandTotal': instance.orderGrandTotal,
      'creditMemoCommentHeading': instance.creditMemoCommentHeading,
      'refundTotalHeading': instance.refundTotalHeading,
      'subtotalHeading': instance.subtotalHeading,
      'subTotal': instance.subTotal,
      'discountHeading': instance.discountHeading,
      'discount': instance.discount,
      'totalTaxHeading': instance.totalTaxHeading,
      'totalTax': instance.totalTax,
      'refundShippingHeading': instance.refundShippingHeading,
      'adjustmentRefundHeading': instance.adjustmentRefundHeading,
      'adjustmentFeeHeading': instance.adjustmentFeeHeading,
      'grandTotalHeading': instance.grandTotalHeading,
      'grandTotal': instance.grandTotal,
      'invoiceId': instance.invoiceId,
      'appendCommentsHeading': instance.appendCommentsHeading,
      'visibleOnFrontendHeading': instance.visibleOnFrontendHeading,
      'emailCopyHeading': instance.emailCopyHeading,
      'refundOnlineButtonHeading': instance.refundOnlineButtonHeading,
      'refundOfflineButtonHeading': instance.refundOfflineButtonHeading,
      'refundOnlineEnableFlag': instance.refundOnlineEnableFlag,
      'refundShipping': instance.refundShipping,
      'adjustmentRefund': instance.adjustmentRefund,
      'adjustmentFee': instance.adjustmentFee,
      'isAppendCommentsChecked': instance.isAppendCommentsChecked,
      'isVisibleOnFrontendChecked': instance.isVisibleOnFrontendChecked,
      'isEmailCopyOfCreditMemoChecked': instance.isEmailCopyOfCreditMemoChecked,
    };

NewCreditMemoItemListData _$NewCreditMemoItemListDataFromJson(
        Map<String, dynamic> json) =>
    NewCreditMemoItemListData(
      json['productName'] as String?,
      (json['customOption'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['downloadableOptionLable'] as String?,
      (json['downloadableOptionValue'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['sku'] as String?,
      json['price'] as String?,
      (json['qty'] as List<dynamic>?)
          ?.map((e) => QtyCreditMemoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPrice'] as String?,
      json['mpcodprice'] as String?,
      json['adminCommission'] as String?,
      json['vendorTotal'] as String?,
      json['subTotal'] as String?,
      json['totalTax'] as String?,
      json['rowTotal'] as String?,
      json['discount'] as String?,
      json['itemId'] as String?,
      json['qtyToRefund'] as String?,
    )..isReturnToStockChecked = json['isReturnToStockChecked'] as bool?;

Map<String, dynamic> _$NewCreditMemoItemListDataToJson(
        NewCreditMemoItemListData instance) =>
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
      'totalTax': instance.totalTax,
      'rowTotal': instance.rowTotal,
      'discount': instance.discount,
      'itemId': instance.itemId,
      'qtyToRefund': instance.qtyToRefund,
      'isReturnToStockChecked': instance.isReturnToStockChecked,
    };

QtyCreditMemoData _$QtyCreditMemoDataFromJson(Map<String, dynamic> json) =>
    QtyCreditMemoData(
      json['label'] as String?,
      (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QtyCreditMemoDataToJson(QtyCreditMemoData instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
