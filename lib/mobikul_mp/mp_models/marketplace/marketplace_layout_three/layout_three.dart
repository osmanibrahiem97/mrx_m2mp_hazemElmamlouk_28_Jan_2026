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
part 'layout_three.g.dart';

@JsonSerializable()
class Layout3 {
  bool? displayBanner;
  String? bannerContent;
  String? bannerImage;
  String? headingOne;
  bool? displayIcon;
  String? iconOne;
  String? labelOne;
  String? iconTwo;
  String? labelTwo;
  String? iconThree;
  String? labelThree;
  String? iconFour;
  String? labelFour;
  String? iconFive;
  String? labelFive;
  String? headingTwo;
  String? headingThree;

  Layout3(
      {this.displayBanner,
      this.bannerContent,
      this.bannerImage,
      this.headingOne,
      this.displayIcon,
      this.iconOne,
      this.labelOne,
      this.iconTwo,
      this.labelTwo,
      this.iconThree,
      this.labelThree,
      this.iconFour,
      this.labelFour,
      this.iconFive,
      this.labelFive,
      this.headingTwo,
      this.headingThree});

  factory Layout3.fromJson(Map<String, dynamic> json) =>
      _$Layout3FromJson(json);

  Map<String, dynamic> toJson() => _$Layout3ToJson(this);
}
