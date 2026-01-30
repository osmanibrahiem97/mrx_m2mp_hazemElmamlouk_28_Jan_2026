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
import '../base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'flag_reasons.g.dart';

@JsonSerializable()
class FlagReasons extends BaseModel {

  int? entity_id;
  String? reason;
  bool? status;


  FlagReasons(this.status,this.entity_id,this.reason);

  factory FlagReasons.fromJson(Map<String, dynamic> json) =>
      _$FlagReasonsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagReasonsToJson(this);
}

