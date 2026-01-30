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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_three/layout_three.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplase_layout_two/layout_two.dart';
part 'marketplace_landing_page_model.g.dart';

@JsonSerializable()
class MarketplaceLandingPageModel extends BaseModel {
  String? pageLayout;
  Layout1? layout1;
  Layout2? layout2;
  Layout3? layout3;

  MarketplaceLandingPageModel(
      {this.pageLayout, this.layout1, this.layout2, this.layout3});

  factory MarketplaceLandingPageModel.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceLandingPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceLandingPageModelToJson(this);
}
