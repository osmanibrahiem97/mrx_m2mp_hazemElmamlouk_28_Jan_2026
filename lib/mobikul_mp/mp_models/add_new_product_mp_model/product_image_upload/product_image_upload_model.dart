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
part 'product_image_upload_model.g.dart';

@JsonSerializable()
class ProductImageUploadModel extends BaseModel {
  String? url;
  String? file;
  String? name;

  ProductImageUploadModel({
    this.url,
    this.file,
    this.name,
  });

  factory ProductImageUploadModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageUploadModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageUploadModelToJson(this);
}
