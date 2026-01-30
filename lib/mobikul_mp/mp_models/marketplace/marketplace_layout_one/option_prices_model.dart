

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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/msrp_price_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/old_price_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'option_prices_model.g.dart';

@JsonSerializable()
class OptionPrices {
  OldPrice? oldPrice;
  OldPrice? basePrice;
  OldPrice? finalPrice;
  List<String>? tierPrices;
  MsrpPrice? msrpPrice;
  int? product;

  OptionPrices(
      {this.oldPrice,
        this.basePrice,
        this.finalPrice,
        this.tierPrices,
        this.msrpPrice,
        this.product});

  factory OptionPrices.fromJson(Map<String, dynamic> json) =>
      _$OptionPricesFromJson(json);

  Map<String, dynamic> toJson() => _$OptionPricesToJson(this);
}