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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_mp_model.dart';
part 'attribute_mp_model.g.dart';

@JsonSerializable()
class AttributeMpModel {
  String? id;
  String? code;
  String? label;
  List<OptionsMpModel>? options;
  String? position;
  String? swatchType;
  bool? updateProductPreviewImage;

  AttributeMpModel(
      {this.id,
      this.code,
      this.label,
      this.options,
      this.position,
      this.swatchType,
      this.updateProductPreviewImage});

  factory AttributeMpModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeMpModelToJson(this);
}
