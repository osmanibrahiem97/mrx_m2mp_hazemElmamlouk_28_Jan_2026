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
part 'seller_data_model.g.dart';

@JsonSerializable()
class SellersData {
  String? logo;
  List<ProductTileData>? products;
  dynamic sellerId;
  String? shopTitle;
  String? shoptitle;
  String? companyDescription;
  String? companyLocality;
  String? bannerImage;
  String? productCount;

  SellersData(
      {this.logo,
      this.products,
      this.sellerId,
      this.shopTitle,
      this.shoptitle,
      this.companyDescription,
      this.companyLocality,
      this.bannerImage,
      this.productCount});

  factory SellersData.fromJson(Map<String, dynamic> json) =>
      _$SellersDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellersDataToJson(this);
}
