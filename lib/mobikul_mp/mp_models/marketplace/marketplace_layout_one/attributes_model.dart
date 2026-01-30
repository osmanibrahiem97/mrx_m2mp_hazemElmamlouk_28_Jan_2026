
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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/options_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'attributes_model.g.dart';

@JsonSerializable()
class Attributes {
  String? id;
  String? code;
  String? label;
  List<Options>? options;
  String? position;
  String? swatchType;
  bool? updateProductPreviewImage;

  Attributes(
      {this.id,
        this.code,
        this.label,
        this.options,
        this.position,
        this.swatchType,
        this.updateProductPreviewImage});

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}