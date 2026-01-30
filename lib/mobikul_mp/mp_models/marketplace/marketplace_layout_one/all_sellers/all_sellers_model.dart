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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/seller_data_model.dart';
part 'all_sellers_model.g.dart';

@JsonSerializable()
class AllSellersModel {
  bool? success;
  String? message;
  String? displayBanner;
  String? bannerContent;
  String? buttonNHeadingLabel;
  String? bottomLabel;
  String? bannerImage;
  String? topLabel;
  List<SellersData>? sellersData;
  String? eTag;

  AllSellersModel(
      {this.success,
      this.message,
      this.displayBanner,
      this.bannerContent,
      this.buttonNHeadingLabel,
      this.bottomLabel,
      this.bannerImage,
      this.topLabel,
      this.sellersData,
      this.eTag});

  factory AllSellersModel.fromJson(Map<String, dynamic> json) =>
      _$AllSellersModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSellersModelToJson(this);
}
