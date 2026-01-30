
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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/seller_info_model.dart';
part 'layout_one_model.g.dart';

@JsonSerializable()
class Layout1 {
  bool? displayBanner;
  String? bannerContent;
  String? buttonHeadingLabel;
  String? bannerImage;
  String? firstLabel;
  bool? displayIcon;
  String? iconOne;
  String? labelOne;
  String? iconTwo;
  String? labelTwo;
  String? iconThree;
  String? labelThree;
  String? iconFour;
  String? labelFour;
  bool? showSellers;
  String? secondLabel;
  List<SellersData>? sellersData;
  String? thirdLabel;
  String? fourthLabel;
  String? aboutContent;
  SellerInfoModel? sellerInfo;

  Layout1(
      {this.displayBanner,
        this.bannerContent,
        this.buttonHeadingLabel,
        this.bannerImage,
        this.firstLabel,
        this.displayIcon,
        this.iconOne,
        this.labelOne,
        this.iconTwo,
        this.labelTwo,
        this.iconThree,
        this.labelThree,
        this.iconFour,
        this.labelFour,
        this.showSellers,
        this.secondLabel,
        this.sellersData,
        this.thirdLabel,
        this.fourthLabel,
        this.aboutContent, this.sellerInfo});

  factory Layout1.fromJson(Map<String, dynamic> json) =>
      _$Layout1FromJson(json);

  Map<String, dynamic> toJson() => _$Layout1ToJson(this);
}