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


part 'seller_orders_list_mp_model.g.dart';

@JsonSerializable()
class SellerOrderListMpModel extends BaseModel{

  @JsonKey(name: "orderList")
  List<SellerOrderListData>? orderList;

  @JsonKey(name: "orderStatus")
  List<OrderStatusData>? orderStatus;

  @JsonKey(name: "totalCount")
  int? totalCount;

  @JsonKey(name: "manageOrder")
  bool? manageOrder;

  @JsonKey(name: "eTag")
  String? eTag;

  SellerOrderListMpModel({this.orderList, this.totalCount});

  factory SellerOrderListMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrderListMpModelToJson(this);

}

@JsonSerializable()
class OrderStatusData {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "label")
  String? label;

  OrderStatusData(
      {this.status,
        this.label
      });


  factory OrderStatusData.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusDataToJson(this);
}

@JsonSerializable()
class SellerOrderListData {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "statusColorCode")
  String? statusColorCode;

  @JsonKey(name: "orderId")
  String? orderId;

  @JsonKey(name: "incrementId")
  String? incrementId;

  @JsonKey(name: "productNames")
  List<ProductNamesData>? productNames;

  @JsonKey(name: "customerDetails")
  CustomerDetailsData? customerDetails;




  SellerOrderListData(
      {this.status,
        this.statusColorCode,
        this.orderId,
        this.incrementId,
        this.productNames,
        this.customerDetails
      });


  factory SellerOrderListData.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderListDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrderListDataToJson(this);
}

@JsonSerializable()
class ProductNamesData {
  @JsonKey(name: "qty")
  int? qty;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "productId")
  String? productId;

  ProductNamesData(
      {this.qty,
        this.name,
        this.productId
      });


  factory ProductNamesData.fromJson(Map<String, dynamic> json) =>
      _$ProductNamesDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductNamesDataToJson(this);
}

@JsonSerializable()
class CustomerDetailsData {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "baseTotal")
  String? baseTotal;

  @JsonKey(name: "purchaseTotal")
  String? purchaseTotal;

  CustomerDetailsData(
      {this.name,
        this.date,
        this.baseTotal,
        this.purchaseTotal
      });


  factory CustomerDetailsData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsDataToJson(this);
}