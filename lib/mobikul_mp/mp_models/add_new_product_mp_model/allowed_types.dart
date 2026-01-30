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
part 'allowed_types.g.dart';

@JsonSerializable()
class AllowedTypes {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  AllowedTypes({this.value, this.label});

  factory AllowedTypes.fromJson(Map<String, dynamic> json) =>
      _$AllowedTypesFromJson(json);

  Map<String, dynamic> toJson() => _$AllowedTypesToJson(this);
}
