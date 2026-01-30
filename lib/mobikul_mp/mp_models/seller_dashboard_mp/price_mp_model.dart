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

import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/old_price_mp_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'price_mp_model.g.dart';

@JsonSerializable()
class PricesMpModel {
  OldPriceMpModel? oldPrice;
  OldPriceMpModel? basePrice;
  OldPriceMpModel? finalPrice;

  PricesMpModel({this.oldPrice, this.basePrice, this.finalPrice});

  factory PricesMpModel.fromJson(Map<String, dynamic> json) =>
      _$PricesMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$PricesMpModelToJson(this);
}
