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
part 'options_mp_model.g.dart';

@JsonSerializable()
class OptionsMpModel {
  String? id;
  String? label;
  List<String>? products;

  OptionsMpModel({this.id, this.label, this.products});

  factory OptionsMpModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsMpModelToJson(this);
}
