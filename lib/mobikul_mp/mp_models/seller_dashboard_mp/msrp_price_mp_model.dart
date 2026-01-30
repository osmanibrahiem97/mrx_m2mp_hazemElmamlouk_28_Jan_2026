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
part 'msrp_price_mp_model.g.dart';

@JsonSerializable()
class MsrpPriceMpModel {
  String? amount;

  MsrpPriceMpModel({this.amount});

  factory MsrpPriceMpModel.fromJson(Map<String, dynamic> json) =>
      _$MsrpPriceMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$MsrpPriceMpModelToJson(this);
}
