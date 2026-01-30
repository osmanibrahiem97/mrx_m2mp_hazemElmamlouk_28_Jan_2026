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

part 'review_list_mp_model.g.dart';

@JsonSerializable()
class ReviewListMpModel {
  String? date;
  String? summary;
  String? userName;
  String? feedPrice;
  String? feedValue;
  String? feedQuality;
  String? description;

  ReviewListMpModel({this.date, this.summary, this.userName, this.feedPrice, this.feedValue, this.feedQuality, this.description});

  factory ReviewListMpModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewListMpModelToJson(this);
}
