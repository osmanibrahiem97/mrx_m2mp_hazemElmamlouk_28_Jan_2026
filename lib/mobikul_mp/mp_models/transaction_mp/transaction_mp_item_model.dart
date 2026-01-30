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



part 'transaction_mp_item_model.g.dart';

@JsonSerializable()
class TransactionMpItemModel {
  String? id;
  String? date;
  String? amount;
  String? comment;
  String? transactionId;

  bool? showRemark;

  TransactionMpItemModel(
      {this.id, this.date, this.amount, this.comment, this.transactionId, this.showRemark});

  factory TransactionMpItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionMpItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionMpItemModelToJson(this);
}
