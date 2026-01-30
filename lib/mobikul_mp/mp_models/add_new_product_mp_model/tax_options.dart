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
part 'tax_options.g.dart';

@JsonSerializable()
class TaxOptions {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  TaxOptions({this.value, this.label});

  factory TaxOptions.fromJson(Map<String, dynamic> json) =>
      _$TaxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxOptionsToJson(this);
}
