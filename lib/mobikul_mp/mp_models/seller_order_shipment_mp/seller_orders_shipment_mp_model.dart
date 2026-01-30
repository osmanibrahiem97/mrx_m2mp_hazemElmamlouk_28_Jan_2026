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


part 'seller_orders_shipment_mp_model.g.dart';

@JsonSerializable()
class SellerOrdersShipmentMpModel extends BaseModel{

  @JsonKey(name: "mainHeading")
  String? mainHeading;

  @JsonKey(name: "subHeading")
  String? subHeading;

  @JsonKey(name: "shipmentIncrementedId")
  String? shipmentIncrementedId;

  @JsonKey(name: "shipmentDate")
  String? shipmentDate;

  @JsonKey(name: "actionButtons")
  List<ActionButtonsListData>? actionButtons;

  @JsonKey(name: "orderInfoHeading")
  String? orderInfoHeading;

  @JsonKey(name: "orderHeading")
  String? orderHeading;

  @JsonKey(name: "orderIncrementedId")
  String? orderIncrementedId;

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
  bool? showAddressInformation;

  @JsonKey(name: "billingAddressHeading")
  String? billingAddressHeading;

  @JsonKey(name: "billingAddress")
  String? billingAddress;

  @JsonKey(name: "shippingAddressHeading")
  String? shippingAddressHeading;

  @JsonKey(name: "shippingAddress")
  String? shippingAddress;

  @JsonKey(name: "paymentAndShippingHeading")
  String? paymentAndShippingHeading;

  @JsonKey(name: "paymentMethod")
  String? paymentMethod;

  @JsonKey(name: "shippingInfoHeading")
  String? shippingInfoHeading;

  @JsonKey(name: "shippingMethod")
  String? shippingMethod;

  @JsonKey(name: "itemShippedHeading")
  String? itemShippedHeading;

  @JsonKey(name: "itemList")
  List<ShipmentItemListData>? itemList;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "shipping")
  String? shipping;

  @JsonKey(name: "discount")
  String? discount;

  @JsonKey(name: "tax")
  String? tax;

  @JsonKey(name: "mpcodcharge")
  String? mpcodcharge;

  @JsonKey(name: "orderTotal")
  String? orderTotal;

  @JsonKey(name: "orderBaseTotal")
  String? orderBaseTotal;

  @JsonKey(name: "vendorTotal")
  String? vendorTotal;

  @JsonKey(name: "vendorBaseTotal")
  String? vendorBaseTotal;

  @JsonKey(name: "adminCommission")
  String? adminCommission;

  @JsonKey(name: "adminBaseCommission")
  String? adminBaseCommission;

  @JsonKey(name: "eTag")
  String? eTag;


  SellerOrdersShipmentMpModel({this.actionButtons,this.itemList, this.orderTotal});

  factory SellerOrdersShipmentMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrdersShipmentMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrdersShipmentMpModelToJson(this);

}

@JsonSerializable()
class ActionButtonsListData {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "confirmMsg")
  String? confirmMsg;

  ActionButtonsListData(
      {this.label,
        this.title,
        this.confirmMsg
      });


  factory ActionButtonsListData.fromJson(Map<String, dynamic> json) =>
      _$ActionButtonsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActionButtonsListDataToJson(this);
}


@JsonSerializable()
class ShipmentItemListData {
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
  List<Qty>? qty;
  // int? qty;

  @JsonKey(name: "totalPrice")
  String? totalPrice;

  @JsonKey(name: "mpcodprice")
  String? mpcodprice;

  @JsonKey(name: "adminCommission")
  String? adminCommission;

  @JsonKey(name: "vendorTotal")
  String? vendorTotal;

  ShipmentItemListData(
      {this.productName,
        this.totalPrice,
        this.vendorTotal
      });


  factory ShipmentItemListData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentItemListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentItemListDataToJson(this);
}

@JsonSerializable()
class Qty {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "value")
  int? value;


  Qty({this.label,this.value
      });


  factory Qty.fromJson(Map<String, dynamic> json) =>
      _$QtyFromJson(json);

  Map<String, dynamic> toJson() => _$QtyToJson(this);
}
