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



part 'transaction_download_mp_model.g.dart';

@JsonSerializable()
class TransactionDownloadMpModel extends BaseModel{
  String? url;

  TransactionDownloadMpModel(
      {
      this.url,
      });

  factory TransactionDownloadMpModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDownloadMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDownloadMpModelToJson(this);
}


