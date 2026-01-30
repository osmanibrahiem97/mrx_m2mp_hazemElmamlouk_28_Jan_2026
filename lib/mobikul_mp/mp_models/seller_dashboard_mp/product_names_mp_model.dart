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
part 'product_names_mp_model.g.dart';

@JsonSerializable()
class ProductNamesMpModel {
  int? qty;
  String? name;
  String? productId;

  ProductNamesMpModel({this.qty, this.name, this.productId});

  factory ProductNamesMpModel.fromJson(Map<String, dynamic> json) =>
      _$ProductNamesMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductNamesMpModelToJson(this);
}