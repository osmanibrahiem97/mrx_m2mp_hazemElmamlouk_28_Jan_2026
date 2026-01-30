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
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_item_model.dart';



part 'transaction_mp_model.g.dart';

@JsonSerializable()
class TransactionMpModel extends BaseModel{
  String? totalSellerEarning;
  double? unformattedTotalSellerEarning;
  String? totalSale;
  double? unformattedTotalSale;
  String? totalTax;
  int? unformattedTotalTax;
  String? totalCommission;
  double? unformattedTotalCommission;
  String? totalPayout;
  double? unformattedTotalPayout;
  String? remainingPayout;
  double? unformattedRemainingPayout;
  int? isWithdrawalEligible;
  int? totalCount;
  List<TransactionMpItemModel>? transactionList;
  String? remainingTransactionAmount;

  TransactionMpModel(
      {
      this.totalSellerEarning,
      this.unformattedTotalSellerEarning,
      this.totalSale,
      this.unformattedTotalSale,
      this.totalTax,
      this.unformattedTotalTax,
      this.totalCommission,
      this.unformattedTotalCommission,
      this.totalPayout,
      this.unformattedTotalPayout,
      this.remainingPayout,
      this.unformattedRemainingPayout,
      this.isWithdrawalEligible,
      this.totalCount,
      this.transactionList,
      this.remainingTransactionAmount,
      });

  factory TransactionMpModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionMpModelToJson(this);
}


