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
part 'review_list_mp_model.g.dart';

@JsonSerializable()
class ReviewListMpModel {
  String? name;
  String? date;
  String? comment;
  dynamic priceRating;
  dynamic valueRating;
  dynamic qualityRating;
  dynamic avgRating;

  ReviewListMpModel(
      {this.name,
        this.date,
        this.comment,
        this.priceRating,
        this.valueRating,
        this.qualityRating,
        this.avgRating});

  factory ReviewListMpModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewListMpModelToJson(this);
}