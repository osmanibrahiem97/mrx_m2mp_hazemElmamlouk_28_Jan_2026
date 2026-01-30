
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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'old_price_model.g.dart';

@JsonSerializable()
class OldPrice {
  int? amount;

  OldPrice({this.amount});

  factory OldPrice.fromJson(Map<String, dynamic> json) =>
      _$OldPriceFromJson(json);

  Map<String, dynamic> toJson() => _$OldPriceToJson(this);
}
