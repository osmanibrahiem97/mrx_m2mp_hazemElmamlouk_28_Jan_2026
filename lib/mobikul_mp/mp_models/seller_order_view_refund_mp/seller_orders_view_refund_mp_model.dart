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


part 'seller_orders_view_refund_mp_model.g.dart';

@JsonSerializable()
class SellerOrdersViewRefundMpModel extends BaseModel{

  @JsonKey(name: "mainHeading")
  String? mainHeading;

  @JsonKey(name: "subHeading")
  String? subHeading;

  @JsonKey(name: "creditmemoStatus")
  String? creditmemoStatus;

  @JsonKey(name: "creditmemoDate")
  String? creditmemoDate;

  @JsonKey(name: "buttons")
  List<ButtonsListData>? buttons;

  @JsonKey(name: "orderInfoHeading")
  String? orderInfoHeading;

  @JsonKey(name: "orderHeading")
  String? orderHeading;

  @JsonKey(name: "orderId")
  dynamic? orderId;

  @JsonKey(name: "orderStatusHeading")
  String? orderStatusHeading;

  @JsonKey(name: "orderStatus")
  String? orderStatus;

  @JsonKey(name: "orderDateHeading")
  String? orderDateHeading;

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

  @JsonKey(name: "shippingAddress")
  String? shippingAddress;

  @JsonKey(name: "shippingMethod")
  String? shippingMethod;

  @JsonKey(name: "AddressInfoHeading")
  String? AddressInfoHeading;

  @JsonKey(name: "billingAddressHeading")
  String? billingAddressHeading;

  @JsonKey(name: "billingAddress")
  String? billingAddress;

  @JsonKey(name: "paymentandshippingHeading")
  String? paymentandshippingHeading;

  @JsonKey(name: "paymentAndShippingHeading")
  String? paymentAndShippingHeading;

  @JsonKey(name: "paymentMethodHeading")
  String? paymentMethodHeading;

  @JsonKey(name: "paymentMethod")
  String? paymentMethod;

  @JsonKey(name: "itemsRefundedHeading")
  String? itemsRefundedHeading;

  @JsonKey(name: "productNameHeading")
  String? productNameHeading;

  @JsonKey(name: "priceHeading")
  String? priceHeading;

  @JsonKey(name: "qtyHeading")
  String? qtyHeading;

  @JsonKey(name: "subtotalHeading")
  String? subtotalHeading;

  @JsonKey(name: "codChargeHeading")
  String? codChargeHeading;

  @JsonKey(name: "taxAmtHeading")
  String? taxAmtHeading;

  @JsonKey(name: "discountAmtHeading")
  String? discountAmtHeading;

  @JsonKey(name: "rowTotalHeading")
  String? rowTotalHeading;

  @JsonKey(name: "itemList")
  List<ViewRefundItemListData>? itemList;

  @JsonKey(name: "totals")
  List<TotalsListData>? totals;



  SellerOrdersViewRefundMpModel({this.buttons,this.itemList, this.totals});

  factory SellerOrdersViewRefundMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrdersViewRefundMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrdersViewRefundMpModelToJson(this);

}

@JsonSerializable()
class ButtonsListData {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "confirm")
  String? confirm;

  ButtonsListData(
      {this.label,
        this.title,
        this.confirm
      });


  factory ButtonsListData.fromJson(Map<String, dynamic> json) =>
      _$ButtonsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonsListDataToJson(this);
}


@JsonSerializable()
class ViewRefundItemListData {
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
  dynamic? qty;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "totalTax")
  String? totalTax;

  @JsonKey(name: "discountTotal")
  String? discountTotal;

  @JsonKey(name: "rowTotal")
  String? rowTotal;

  ViewRefundItemListData(
      {this.productName,
        this.subTotal,
        this.rowTotal
      });


  factory ViewRefundItemListData.fromJson(Map<String, dynamic> json) =>
      _$ViewRefundItemListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ViewRefundItemListDataToJson(this);
}


@JsonSerializable()
class TotalsListData {
  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "value")
  String? value;

  @JsonKey(name: "formattedValue")
  String? formattedValue;

  TotalsListData(
      {this.code,
        this.label,
        this.value,
        this.formattedValue
      });


  factory TotalsListData.fromJson(Map<String, dynamic> json) =>
      _$TotalsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$TotalsListDataToJson(this);
}

