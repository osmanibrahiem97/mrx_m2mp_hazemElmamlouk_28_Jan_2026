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

part 'seller_flag_reasons_mp_model.g.dart';

@JsonSerializable()
class SellerFlagReasonsMpModel {
  int? entity_id;
  String? reason;
  String? createdAt;
  String? updatedAt;
  bool? status;

  SellerFlagReasonsMpModel({this.entity_id, this.reason, this.createdAt, this.updatedAt, this.status});


  factory SellerFlagReasonsMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerFlagReasonsMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerFlagReasonsMpModelToJson(this);
}
