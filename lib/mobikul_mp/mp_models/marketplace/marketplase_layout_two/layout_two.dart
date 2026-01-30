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
part 'layout_two.g.dart';

@JsonSerializable()
class Layout2 {
  bool? displayBanner;
  String? bannerContent;
  String? buttonLabel;
  String? bannerImage;

  Layout2(
      {this.displayBanner,
      this.bannerContent,
      this.buttonLabel,
      this.bannerImage});

  factory Layout2.fromJson(Map<String, dynamic> json) =>
      _$Layout2FromJson(json);

  Map<String, dynamic> toJson() => _$Layout2ToJson(this);
}
