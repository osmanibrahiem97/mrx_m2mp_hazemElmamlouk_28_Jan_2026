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
import 'package:test_new/mobikul/models/base_model.dart';

part 'save_product_model.g.dart';

@JsonSerializable()
class SaveProductModel extends BaseModel {
  int? productId;

  SaveProductModel({
    this.productId,
  });

  factory SaveProductModel.fromJson(Map<String, dynamic> json) =>
      _$SaveProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveProductModelToJson(this);
}
