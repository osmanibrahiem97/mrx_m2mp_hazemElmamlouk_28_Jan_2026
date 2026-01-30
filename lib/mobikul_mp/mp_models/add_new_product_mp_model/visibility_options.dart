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
part 'visibility_options.g.dart';

@JsonSerializable()
class VisibilityOptions {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  VisibilityOptions({this.value, this.label});

  factory VisibilityOptions.fromJson(Map<String, dynamic> json) =>
      _$VisibilityOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$VisibilityOptionsToJson(this);
}
