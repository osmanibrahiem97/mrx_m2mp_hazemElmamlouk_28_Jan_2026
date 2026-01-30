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
part 'inventory_availability_options.g.dart';

@JsonSerializable()
class InventoryAvailabilityOptions {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  InventoryAvailabilityOptions({this.value, this.label});

  factory InventoryAvailabilityOptions.fromJson(Map<String, dynamic> json) =>
      _$InventoryAvailabilityOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryAvailabilityOptionsToJson(this);
}
