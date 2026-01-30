
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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/seller_rating_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'seller_info_model.g.dart';

@JsonSerializable()
class SellerInfoModel {
  bool? displaySellerInfo;
  int? sellerId;
  String? shoptitle;
  List<SellerRating>? sellerRating;
  String? reviewDescription;
  String? sellerName;
  String? sellerLocation;
  int? sellerProductCount;
  bool? showContactSeller;
  String? sellerAverageRating;

  SellerInfoModel({this.displaySellerInfo, this.sellerId, this.shoptitle, this.sellerRating, this.reviewDescription, this.sellerName, this.sellerLocation, this.sellerProductCount, this.showContactSeller, this.sellerAverageRating});

  factory SellerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SellerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerInfoModelToJson(this);
}

