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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/layout_one_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplase_layout_two/layout_two.dart';
part 'marketplace_layout_two_model.g.dart';

@JsonSerializable()
class MarketplaceLayoutTwoModel extends BaseModel {
  String? pageLayout;
  Layout2? layout2;

  MarketplaceLayoutTwoModel({this.pageLayout, this.layout2});

  factory MarketplaceLayoutTwoModel.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceLayoutTwoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceLayoutTwoModelToJson(this);
}
