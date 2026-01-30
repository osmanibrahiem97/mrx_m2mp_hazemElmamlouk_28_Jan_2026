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

import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/base_model.dart';



part 'transaction_view_mp_item_model.g.dart';

@JsonSerializable()
class TransactionViewMpItemModel {

  @JsonKey(name: "qty")
  String? qty;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "totalTax")
  String? totalTax;

  @JsonKey(name: "shipping")
  String? shipping;

  @JsonKey(name: "totalPrice")
  String? totalPrice;

  @JsonKey(name: "commission")
  String? commission;

  @JsonKey(name: "incrementId")
  String? incrementId;

  @JsonKey(name: "productName")
  String? productName;

  @JsonKey(name: "subTotal")
  String? subTotal;

  TransactionViewMpItemModel(
      {
        this.qty,
        this.price,
        this.totalTax,
        this.shipping,
        this.totalPrice,
        this.commission,
        this.incrementId,
        this.productName,
        this.subTotal
});

  factory TransactionViewMpItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionViewMpItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionViewMpItemModelToJson(this);
}
