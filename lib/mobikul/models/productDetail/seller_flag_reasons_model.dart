/*
* Webkul Software.
*
@package Mobikul Application Code.
* @Category Mobikul
* @author Webkul <support@webkul.com>
* @Copyright (c) Webkul Software Private Limited (https://webkul.com)
* @license https://store.webkul.com/license.html
* @link https://store.webkul.com/license.html
*
*/
import 'package:json_annotation/json_annotation.dart';

part 'seller_flag_reasons_model.g.dart';

@JsonSerializable()
class SellerFlagReasonsModel {
  int? entity_id;
  String? reason;
  String? createdAt;
  String? updatedAt;
  bool? status;

  SellerFlagReasonsModel({this.entity_id, this.reason, this.createdAt, this.updatedAt, this.status});


  factory SellerFlagReasonsModel.fromJson(Map<String, dynamic> json) =>
      _$SellerFlagReasonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerFlagReasonsModelToJson(this);
}
