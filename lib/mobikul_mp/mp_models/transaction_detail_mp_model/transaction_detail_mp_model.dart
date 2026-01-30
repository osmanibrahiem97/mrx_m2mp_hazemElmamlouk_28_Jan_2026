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

import 'transaction_view_mp_item_model.dart';

part 'transaction_detail_mp_model.g.dart';

@JsonSerializable()
class TransactionDetailMpModel extends BaseModel {
  @JsonKey(name: "transactionId")
  String? transactionId;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "method")
  String? method;

  @JsonKey(name: "amount")
  String? amount;

  @JsonKey(name: "comment")
  String? comment;

  @JsonKey(name: "orderList")
  List<TransactionViewMpItemModel>? orderList;

  TransactionDetailMpModel(
      {this.transactionId,
      this.date,
      this.type,
      this.method,
      this.amount,
      this.comment,
      this.orderList});


  factory TransactionDetailMpModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailMpModelToJson(this);
}
