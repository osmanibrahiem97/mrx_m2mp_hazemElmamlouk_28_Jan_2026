/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'package:test_new/mobikul/models/base_model.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/order_details/order_detail_model.dart';

part 'seller_orders_creditmemo_mp_model.g.dart';


@JsonSerializable()
class SellerOrdersCreditmemoMpModel extends BaseModel{

  @JsonKey(name: "mainHeading")
  String? mainHeading;

  @JsonKey(name: "subHeading")
  String? subHeading;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "orderDate")
  String? orderDate;

  @JsonKey(name: "buyerInfoHeading")
  String? buyerInfoHeading;

  @JsonKey(name: "customerNameHeading")
  String? customerNameHeading;

  @JsonKey(name: "customerName")
  String? customerName;

  @JsonKey(name: "customerEmailHeading")
  String? customerEmailHeading;

  @JsonKey(name: "customerEmail")
  String? customerEmail;

  @JsonKey(name: "orderInfoHeading")
  String? orderInfoHeading;

  @JsonKey(name: "paymentMethodHeading")
  String? paymentMethodHeading;

  @JsonKey(name: "billingAddress")
  String? billingAddress;

  @JsonKey(name: "paymentMethod")
  String? paymentMethod;

  @JsonKey(name: "itemsRefundHeading")
  String? itemsRefundHeading;

  @JsonKey(name: "itemsProductNameHeading")
  String? itemsProductNameHeading;

  @JsonKey(name: "itemsPiceHeading")
  String? itemsPiceHeading;

  @JsonKey(name: "itemsQtyHeading")
  String? itemsQtyHeading;

  @JsonKey(name: "itemsReturnToStockHeading")
  String? itemsReturnToStockHeading;

  @JsonKey(name: "itemsQtyToRefundHeading")
  String? itemsQtyToRefundHeading;

  @JsonKey(name: "itemsSubtotalHeading")
  String? itemsSubtotalHeading;

  @JsonKey(name: "itemsCodHeading")
  String? itemsCodHeading;

  @JsonKey(name: "itemsTaxAmtHeading")
  String? itemsTaxAmtHeading;

  @JsonKey(name: "itemsDiscountAmtHeading")
  String? itemsDiscountAmtHeading;

  @JsonKey(name: "itemsRowTotalHeading")
  String? itemsRowTotalHeading;

  @JsonKey(name: "itemList")
  List<NewCreditMemoItemListData>? itemList;

  @JsonKey(name: "paidAmountHeading")
  String? paidAmountHeading;

  @JsonKey(name: "refundAmountHeading")
  String? refundAmountHeading;

  @JsonKey(name: "shippingAmountHeading")
  String? shippingAmountHeading;

  @JsonKey(name: "shippingRefundHeading")
  String? shippingRefundHeading;

  @JsonKey(name: "orderGrandTotalHeading")
  String? orderGrandTotalHeading;

  @JsonKey(name: "paidAmount")
  String? paidAmount;

  @JsonKey(name: "refundAmount")
  String? refundAmount;

  @JsonKey(name: "shippingAmount")
  String? shippingAmount;

  @JsonKey(name: "shippingRefund")
  String? shippingRefund;

  @JsonKey(name: "orderGrandTotal")
  String? orderGrandTotal;

  @JsonKey(name: "creditMemoCommentHeading")
  String? creditMemoCommentHeading;

  @JsonKey(name: "refundTotalHeading")
  String? refundTotalHeading;

  @JsonKey(name: "subtotalHeading")
  String? subtotalHeading;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "discountHeading")
  String? discountHeading;

  @JsonKey(name: "discount")
  String? discount;

  @JsonKey(name: "totalTaxHeading")
  String? totalTaxHeading;

  @JsonKey(name: "totalTax")
  String? totalTax;

  @JsonKey(name: "refundShippingHeading")
  String? refundShippingHeading;

  @JsonKey(name: "adjustmentRefundHeading")
  String? adjustmentRefundHeading;

  @JsonKey(name: "adjustmentFeeHeading")
  String? adjustmentFeeHeading;

  @JsonKey(name: "grandTotalHeading")
  String? grandTotalHeading;

  @JsonKey(name: "grandTotal")
  String? grandTotal;

  @JsonKey(name: "invoiceId")
  String? invoiceId;

  @JsonKey(name: "appendCommentsHeading")
  String? appendCommentsHeading;

  @JsonKey(name: "visibleOnFrontendHeading")
  String? visibleOnFrontendHeading;

  @JsonKey(name: "emailCopyHeading")
  String? emailCopyHeading;

  @JsonKey(name: "refundOnlineButtonHeading")
  String? refundOnlineButtonHeading;

  @JsonKey(name: "refundOfflineButtonHeading")
  String? refundOfflineButtonHeading;

  @JsonKey(name: "refundOnlineEnableFlag")
  bool? refundOnlineEnableFlag;

  String? refundShipping = "0";
  String? adjustmentRefund = "0";
  String? adjustmentFee = "0";
  bool? isAppendCommentsChecked = false;
  bool? isVisibleOnFrontendChecked = false;
  bool? isEmailCopyOfCreditMemoChecked = false;


  SellerOrdersCreditmemoMpModel(
      this.mainHeading,
      this.subHeading,
      this.status,
      this.orderDate,
      this.buyerInfoHeading,
      this.customerNameHeading,
      this.customerName,
      this.customerEmailHeading,
      this.customerEmail,
      this.orderInfoHeading,
      this.paymentMethodHeading,
      this.paymentMethod,
      this.itemsRefundHeading,
      this.itemsProductNameHeading,
      this.itemsPiceHeading,
      this.itemsQtyHeading,
      this.itemsReturnToStockHeading,
      this.itemsQtyToRefundHeading,
      this.itemsSubtotalHeading,
      this.itemsCodHeading,
      this.itemsTaxAmtHeading,
      this.itemsDiscountAmtHeading,
      this.itemsRowTotalHeading,
      this.itemList,
      this.paidAmountHeading,
      this.refundAmountHeading,
      this.shippingAmountHeading,
      this.shippingRefundHeading,
      this.orderGrandTotalHeading,
      this.paidAmount,
      this.refundAmount,
      this.shippingAmount,
      this.shippingRefund,
      this.orderGrandTotal,
      this.creditMemoCommentHeading,
      this.refundTotalHeading,
      this.subtotalHeading,
      this.subTotal,
      this.discountHeading,
      this.discount,
      this.totalTaxHeading,
      this.totalTax,
      this.refundShippingHeading,
      this.adjustmentRefundHeading,
      this.adjustmentFeeHeading,
      this.grandTotalHeading,
      this.grandTotal,
      this.invoiceId,
      this.appendCommentsHeading,
      this.visibleOnFrontendHeading,
      this.emailCopyHeading,
      this.refundOnlineButtonHeading,
      this.refundOfflineButtonHeading,
      this.refundOnlineEnableFlag);

  factory SellerOrdersCreditmemoMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrdersCreditmemoMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrdersCreditmemoMpModelToJson(this);

}

@JsonSerializable()
class NewCreditMemoItemListData {
  @JsonKey(name: "productName")
  String? productName;

  @JsonKey(name: "customOption")
  List<String>? customOption;

  @JsonKey(name: "downloadableOptionLable")
  String? downloadableOptionLable;

  @JsonKey(name: "downloadableOptionValue")
  List<String>? downloadableOptionValue;

  @JsonKey(name: "sku")
  String? sku;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "qty")
  List<QtyCreditMemoData>? qty;

  @JsonKey(name: "totalPrice")
  String? totalPrice;

  @JsonKey(name: "mpcodprice")
  String? mpcodprice;

  @JsonKey(name: "adminCommission")
  String? adminCommission;

  @JsonKey(name: "vendorTotal")
  String? vendorTotal;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "totalTax")
  String? totalTax;

  @JsonKey(name: "rowTotal")
  String? rowTotal;

  @JsonKey(name: "discount")
  String? discount;

  @JsonKey(name: "itemId")
  String? itemId;

  String? qtyToRefund= "1";
  bool? isReturnToStockChecked = false;


  NewCreditMemoItemListData(
      this.productName,
      this.customOption,
      this.downloadableOptionLable,
      this.downloadableOptionValue,
      this.sku,
      this.price,
      this.qty,
      this.totalPrice,
      this.mpcodprice,
      this.adminCommission,
      this.vendorTotal,
      this.subTotal,
      this.totalTax,
      this.rowTotal,
      this.discount,
      this.itemId,
      this.qtyToRefund);

  factory NewCreditMemoItemListData.fromJson(Map<String, dynamic> json) =>
      _$NewCreditMemoItemListDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewCreditMemoItemListDataToJson(this);
}


@JsonSerializable()
class QtyCreditMemoData {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "value")
  int? value;

  QtyCreditMemoData(this.label, this.value);

  factory QtyCreditMemoData.fromJson(Map<String, dynamic> json) =>
      _$QtyCreditMemoDataFromJson(json);

  Map<String, dynamic> toJson() => _$QtyCreditMemoDataToJson(this);
}

