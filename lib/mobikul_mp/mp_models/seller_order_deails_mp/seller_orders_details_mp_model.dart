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


part 'seller_orders_details_mp_model.g.dart';

@JsonSerializable()
class SellerOrderDetailsMpModel extends BaseModel{

  @JsonKey(name: "invoiceIncrement")
  String? invoiceIncrement;

  @JsonKey(name: "shipmentIncrement")
  String? shipmentIncrement;

  @JsonKey(name: "orderData")
  SellerOrderData? orderData;

  @JsonKey(name: "statusLabel")
  String? statusLabel;

  @JsonKey(name: "incrementId")
  String? incrementId;

  @JsonKey(name: "orderDate")
  String? orderDate;

  @JsonKey(name: "orderTotal")
  String? orderTotal;

  @JsonKey(name: "state")
  String? state;

  @JsonKey(name: "invoiceId")
  String? invoiceId;

  @JsonKey(name: "shipmentId")
  String? shipmentId;

  @JsonKey(name: "shippingAddress")
  String? shippingAddress;

  @JsonKey(name: "manageOrder")
  bool? manageOrder;

  @JsonKey(name: "cancelButton")
  bool? cancelButton;

  @JsonKey(name: "invoiceButton")
  bool? invoiceButton;

  @JsonKey(name: "sendEmailButton")
  bool? sendEmailButton;

  @JsonKey(name: "creditMemoTab")
  bool? creditMemoTab;

  @JsonKey(name: "creditMemoButton")
  bool? creditMemoButton;

  @JsonKey(name: "showBuyerInformation")
  dynamic showBuyerInformation;

  @JsonKey(name: "buyerName")
  String? buyerName;

  @JsonKey(name: "buyerEmail")
  dynamic buyerEmail;

  @JsonKey(name: "showAddressInformation")
  dynamic? showAddressInformation;

  @JsonKey(name: "billingAddress")
  dynamic billingAddress;

  @JsonKey(name: "shippingMethod")
  String? shippingMethod;

  @JsonKey(name: "subHeading")
  String? subHeading;

  @JsonKey(name: "mainHeading")
  String? mainHeading;

  @JsonKey(name: "statusHeading")
  String? statusHeading;

  @JsonKey(name: "amountHeading")
  String? amountHeading;

  @JsonKey(name: "actionHeading")
  String? actionHeading;

  @JsonKey(name: "createdAtHeading")
  String? createdAtHeading;

  @JsonKey(name: "creditMemoIdHeading")
  String? creditMemoIdHeading;

  @JsonKey(name: "creditMemoList")
  List<CreditMemoListData>? creditMemoList;

  @JsonKey(name: "eTag")
  String? eTag;

  @JsonKey(name: "paymentMethod")
  String? paymentMethod;
  @JsonKey(name:"shipmentButton")
  bool? shipmentButton;


  SellerOrderDetailsMpModel(
      this.invoiceIncrement,
      this.shipmentIncrement,
      this.orderData,
      this.statusLabel,
      this.incrementId,
      this.orderDate,
      this.orderTotal,
      this.state,
      this.invoiceId,
      this.shipmentId,
      this.shippingAddress,
      this.manageOrder,
      this.cancelButton,
      this.invoiceButton,
      this.sendEmailButton,
      this.creditMemoButton,
      this.showBuyerInformation,
      this.buyerName,
      this.buyerEmail,
      this.showAddressInformation,
      this.billingAddress,
      this.shippingMethod,
      this.subHeading,
      this.mainHeading,
      this.statusHeading,
      this.amountHeading,
      this.actionHeading,
      this.createdAtHeading,
      this.creditMemoIdHeading,
      this.creditMemoList,
      this.eTag,
      this.paymentMethod,this.shipmentButton);


  /*
  *   SellerOrderDetailsMpModel({this.orderData, this.orderTotal});
*/



  factory SellerOrderDetailsMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderDetailsMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrderDetailsMpModelToJson(this);

}

// {
//       "entityId": "15",
//       "incrementId": "000000015",
//       "billToName": "John Doe",
//       "createdAt": "2021-11-03 14:42:37",
//       "status": "Refunded",
//       "amount": "$100.00"
//     }

@JsonSerializable()
class CreditMemoListData {
  @JsonKey(name: "entityId")
  String? entityId;

  @JsonKey(name: "incrementId")
  String? incrementId;

  @JsonKey(name: "billToName")
  String? billToName;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "amount")
  String? amount;

  CreditMemoListData(
      {
        this.entityId,
        this.incrementId,
        this.billToName,
        this.createdAt,
        this.status,
        this.amount
      });


  factory CreditMemoListData.fromJson(Map<String, dynamic> json) =>
      _$CreditMemoListDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreditMemoListDataToJson(this);
}

@JsonSerializable()
class SellerOrderData {
  @JsonKey(name: "itemList")
  List<SellerItemListData>? itemList;

  @JsonKey(name: "totals")
  List<SellerTotalsData>? totals;

  SellerOrderData(
      {this.itemList,
        this.totals
      });


  factory SellerOrderData.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrderDataToJson(this);
}

@JsonSerializable()
class SellerItemListData {
  @JsonKey(name: "sellerItemCost")
  String? sellerItemCost;

  @JsonKey(name: "formattedSellerItemCost")
  String? formattedSellerItemCost;

  @JsonKey(name: "totalTaxPerItem")
  String? totalTaxPerItem;

  @JsonKey(name: "formattedTotalTaxPerItem")
  String? formattedTotalTaxPerItem;

  @JsonKey(name: "adminItemCommission")
  String? adminItemCommission;

  @JsonKey(name: "formattedAdminItemCommission")
  String? formattedAdminItemCommission;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "productId")
  String? productId;

  @JsonKey(name: "option")
  OptionLabeldata? option;

  @JsonKey(name: "sku")
  String? sku;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "qty")
  SellerQtyData? qty;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "image")
  String? image;


  SellerItemListData(
      this.sellerItemCost,
      this.formattedSellerItemCost,
      this.totalTaxPerItem,
      this.formattedTotalTaxPerItem,
      this.adminItemCommission,
      this.formattedAdminItemCommission,
      this.name,
      this.productId,
      this.option,
      this.sku,
      this.price,
      this.qty,
      this.subTotal,
      this.image);

  factory SellerItemListData.fromJson(Map<String, dynamic> json) =>
      _$SellerItemListDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerItemListDataToJson(this);
}

@JsonSerializable()
class SellerQtyData {
  @JsonKey(name: "Ordered")
  int? Ordered;

  @JsonKey(name: "Shipped")
  int? Shipped;

  @JsonKey(name: "Canceled")
  int? Canceled;

  @JsonKey(name: "Refunded")
  int? Refunded;

  SellerQtyData(
      {this.Ordered,
        this.Shipped,
        this.Canceled,
        this.Refunded
      });


  factory SellerQtyData.fromJson(Map<String, dynamic> json) =>
      _$SellerQtyDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerQtyDataToJson(this);
}

@JsonSerializable()
class SellerTotalsData {
  @JsonKey(name: "code")
  dynamic? code;

  @JsonKey(name: "label")
  dynamic? label;

  @JsonKey(name: "value")
  dynamic? value;

  @JsonKey(name: "formattedValue")
  dynamic? formattedValue;

  SellerTotalsData(
      {this.code,
        this.label,
        this.value,
        this.formattedValue
      });


  factory SellerTotalsData.fromJson(Map<String, dynamic> json) =>
      _$SellerTotalsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerTotalsDataToJson(this);
}

@JsonSerializable()
class OptionLabeldata {
  @JsonKey(name: "label")
  dynamic? label;

  @JsonKey(name: "value")
  dynamic? value;

  OptionLabeldata(
      {this.label,
        this.value
      });


  factory OptionLabeldata.fromJson(Map<String, dynamic> json) =>
      _$OptionLabeldataFromJson(json);

  Map<String, dynamic> toJson() => _$OptionLabeldataToJson(this);
}