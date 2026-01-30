


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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/old_price_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'prices_model.g.dart';

@JsonSerializable()
class Prices {
  OldPrice? oldPrice;
  OldPrice? basePrice;
  OldPrice? finalPrice;

  Prices({this.oldPrice, this.basePrice, this.finalPrice});

  factory Prices.fromJson(Map<String, dynamic> json) =>
      _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}