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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/msrp_price_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/old_price_mp_model.dart';
part 'options_price_mp_model.g.dart';

@JsonSerializable()
class OptionPriceMpModel {
  OldPriceMpModel? oldPrice;
  OldPriceMpModel? basePrice;
  OldPriceMpModel? finalPrice;
  List<dynamic>? tierPrices;
  MsrpPriceMpModel? msrpPrice;
  int? product;

  OptionPriceMpModel(
      {this.oldPrice,
      this.basePrice,
      this.finalPrice,
      this.tierPrices,
      this.msrpPrice,
      this.product});

  factory OptionPriceMpModel.fromJson(Map<String, dynamic> json) =>
      _$OptionPriceMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionPriceMpModelToJson(this);
}
