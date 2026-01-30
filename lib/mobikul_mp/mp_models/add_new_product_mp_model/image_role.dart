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
part 'image_role.g.dart';

@JsonSerializable()
class ImageRole {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "isSelected")
  bool? isSelected = false;

  ImageRole({this.id, this.value, this.label, this.isSelected});

  factory ImageRole.fromJson(Map<String, dynamic> json) =>
      _$ImageRoleFromJson(json);

  Map<String, dynamic> toJson() => _$ImageRoleToJson(this);
}
