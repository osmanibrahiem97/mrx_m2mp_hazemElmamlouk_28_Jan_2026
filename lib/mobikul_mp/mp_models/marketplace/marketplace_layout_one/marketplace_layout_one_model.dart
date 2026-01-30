
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
part 'marketplace_layout_one_model.g.dart';

@JsonSerializable()
class MarketplaceLayoutOneModel extends BaseModel{
  String? pageLayout;
  Layout1? layout1;

  MarketplaceLayoutOneModel(
      {this.pageLayout, this.layout1});

  factory MarketplaceLayoutOneModel.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceLayoutOneModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceLayoutOneModelToJson(this);
}

















