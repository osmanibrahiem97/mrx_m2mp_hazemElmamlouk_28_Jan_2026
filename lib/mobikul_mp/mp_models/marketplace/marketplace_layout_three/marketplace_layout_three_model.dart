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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_three/layout_three.dart';
part 'marketplace_layout_three_model.g.dart';

@JsonSerializable()
class MarketplaceLayoutThreeModel extends BaseModel {
  String? pageLayout;
  Layout3? layout3;

  MarketplaceLayoutThreeModel({this.pageLayout, this.layout3});

  factory MarketplaceLayoutThreeModel.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceLayoutThreeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceLayoutThreeModelToJson(this);
}
