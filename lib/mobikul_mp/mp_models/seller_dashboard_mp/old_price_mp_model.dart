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
part 'old_price_mp_model.g.dart';

@JsonSerializable()
class OldPriceMpModel {
  int? amount;

  OldPriceMpModel({this.amount});

  factory OldPriceMpModel.fromJson(Map<String, dynamic> json) =>
      _$OldPriceMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OldPriceMpModelToJson(this);
}
