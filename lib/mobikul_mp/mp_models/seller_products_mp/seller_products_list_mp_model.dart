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

part 'seller_products_list_mp_model.g.dart';

@JsonSerializable()
class SellerProductsListMpModel extends BaseModel {
  @JsonKey(name: "productList")
  List<SellerProductListData>? productList;

  @JsonKey(name: "totalCount")
  int? totalCount;

  SellerProductsListMpModel({this.productList, this.totalCount});

  factory SellerProductsListMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerProductsListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerProductsListMpModelToJson(this);
}

@JsonSerializable()
class SellerProductListData {
  String? productId;
  String? image;
  bool? openable;
  String? productPrice;
  String? name;
  String? productType;
  String? sku;
  String? specialPrice;
  String? specialFromDate;
  String? taxClassId;
  String? specialToDate;
  String? status;
  String? qtySold;
  String? qtyPending;
  String? qtyConfirmed;
  String? earnedAmount;

  SellerProductListData(
      {this.productId,
      this.image,
      this.openable,
      this.productPrice,
      this.name,
      this.productType,
      this.sku,
      this.specialPrice,
      this.specialFromDate,
      this.taxClassId,
      this.specialToDate,
      this.status,
      this.qtySold,
      this.qtyPending,
      this.qtyConfirmed,
      this.earnedAmount});

  factory SellerProductListData.fromJson(Map<String, dynamic> json) =>
      _$SellerProductListDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerProductListDataToJson(this);
}
