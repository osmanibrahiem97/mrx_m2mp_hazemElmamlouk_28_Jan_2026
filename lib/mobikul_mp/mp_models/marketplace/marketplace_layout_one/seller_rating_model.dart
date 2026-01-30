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
import 'package:test_new/mobikul/models/categoryPage/product_tile_data.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/products_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'seller_rating_model.g.dart';

@JsonSerializable()
class SellerRating {
  String? label;
  double? value;

  SellerRating({this.label, this.value});

  SellerRating.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}