
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
part 'seller_data.g.dart';

@JsonSerializable()
class SellersData {
  String? logo;
  int? sellerId;
  String? shoptitle;
  String? companyDescription;
  String? companyLocality;
  String? bannerImage;
  String? productCount;

  SellersData(
      {this.logo,
        this.sellerId,
        this.shoptitle,
        this.companyDescription,
        this.companyLocality,
        this.bannerImage,
        this.productCount});

  factory SellersData.fromJson(Map<String, dynamic> json) =>
      _$SellersDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellersDataToJson(this);
}