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
part 'allowed_attributes.g.dart';

@JsonSerializable()
class AllowedAttributes {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  AllowedAttributes({this.value, this.label});

  factory AllowedAttributes.fromJson(Map<String, dynamic> json) =>
      _$AllowedAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AllowedAttributesToJson(this);
}
