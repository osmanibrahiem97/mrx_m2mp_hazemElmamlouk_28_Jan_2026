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

import 'dart:ffi';

import 'package:test_new/mobikul/models/base_model.dart';

import 'package:json_annotation/json_annotation.dart';


part 'seller_invoice_screen_mp_model.g.dart';

@JsonSerializable()
class SellerInvoiceScreenMpModel extends BaseModel{

  @JsonKey(name: "mainHeading")
  String? mainHeading;

  @JsonKey(name: "subHeading")
  String? subHeading;

  @JsonKey(name: "invoiceStatus")
  String? invoiceStatus;

  @JsonKey(name: "invoiceDate")
  String? invoiceDate;

  @JsonKey(name: "actionButtons")
  List<ActionButtonsModel>? actionButtons;

  @JsonKey(name: "orderInfoHeading")
  String? orderInfoHeading;

  @JsonKey(name: "orderHeading")
  String? orderHeading;

  @JsonKey(name: "orderStatusHeading")
  String? orderStatusHeading;

  @JsonKey(name: "orderStatus")
  String? orderStatus;

  @JsonKey(name: "orderDateHeading")
  String? orderDateHeading;

  @JsonKey(name: "orderDate")
  String? orderDate;

  @JsonKey(name: "showBuyerInformation")
  bool? showBuyerInformation;

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

  @JsonKey(name: "State")
  String? State;

  @JsonKey(name: "StatusColorCode")
  String? StatusColorCode;

  @JsonKey(name: "addressinfoHeading")
  String? addressinfoHeading;

  @JsonKey(name: "showAddressInformation")
  dynamic? showAddressInformation;

  @JsonKey(name: "billingAddressHeading")
  String? billingAddressHeading;

  @JsonKey(name: "billingAddress")
  String? billingAddress;

  @JsonKey(name: "paymentAndShippingHeading")
  String? paymentAndShippingHeading;

  @JsonKey(name: "paymentInfoHeading")
  String? paymentInfoHeading;

  @JsonKey(name: "paymentMethod")
  String? paymentMethod;

  @JsonKey(name: "itemInvoicedHeading")
  String? itemInvoicedHeading;

  @JsonKey(name: "itemList")
  List<InvoiceItemListModel>? itemList;

  @JsonKey(name: "totals")
  List<InvoiceTotalsModel>? totals;

  @JsonKey(name: "cartTotal")
  String? cartTotal;

  @JsonKey(name: "adminTotalTax")
  List<dynamic>? adminTotalTax;

  @JsonKey(name: "vendorTotalTax")
  List<dynamic>? vendorTotalTax;

  @JsonKey(name: "eTag")
  String? eTag;


  SellerInvoiceScreenMpModel(
      this.mainHeading,
      this.subHeading,
      this.invoiceStatus,
      this.invoiceDate,
      this.actionButtons,
      this.orderInfoHeading,
      this.orderHeading,
      this.orderStatusHeading,
      this.orderStatus,
      this.orderDateHeading,
      this.orderDate,
      this.showBuyerInformation,
      this.buyerInfoHeading,
      this.customerNameHeading,
      this.customerName,
      this.customerEmailHeading,
      this.customerEmail,
      this.State,
      this.StatusColorCode,
      this.addressinfoHeading,
      this.showAddressInformation,
      this.billingAddressHeading,
      this.billingAddress,
      this.paymentAndShippingHeading,
      this.paymentInfoHeading,
      this.paymentMethod,
      this.itemInvoicedHeading,
      this.itemList,
      this.totals,
      this.cartTotal,
      this.adminTotalTax,
      this.vendorTotalTax,
      this.eTag);

  factory SellerInvoiceScreenMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerInvoiceScreenMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerInvoiceScreenMpModelToJson(this);

}

@JsonSerializable()
class ActionButtonsModel {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "confirmMsg")
  String? confirmMsg;

  ActionButtonsModel(
      {this.label,
        this.title,
        this.confirmMsg
      });


  factory ActionButtonsModel.fromJson(Map<String, dynamic> json) =>
      _$ActionButtonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionButtonsModelToJson(this);
}

@JsonSerializable()
class InvoiceItemListModel {
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
  List<SellerQtyDataModel>? qty;

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


  InvoiceItemListModel(
      {this.productName,
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
      });


  factory InvoiceItemListModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemListModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceItemListModelToJson(this);
}

@JsonSerializable()
class SellerQtyDataModel {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "value")
  int? value;

  SellerQtyDataModel(
      {this.label,
        this.value
      });


  factory SellerQtyDataModel.fromJson(Map<String, dynamic> json) =>
      _$SellerQtyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerQtyDataModelToJson(this);
}

@JsonSerializable()
class InvoiceTotalsModel {
  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "value")
  String? value;

  @JsonKey(name: "formattedValue")
  String? formattedValue;

  InvoiceTotalsModel(
      {this.code,
        this.label,
        this.value,
        this.formattedValue
      });


  factory InvoiceTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceTotalsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceTotalsModelToJson(this);
}
