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

part 'product_collection_data.g.dart';

@JsonSerializable()
class ProductCollectionData {
  bool? selected;
  int? entity_id;
  String? thumbnail;
  String? name;
  String? attrinuteSet;
  String? status;
  String? type;
  String? sku;
  String? price;

  ProductCollectionData(
      {this.selected,
      this.entity_id,
      this.thumbnail,
      this.name,
      this.attrinuteSet,
      this.status,
      this.type,
      this.sku,
      this.price});

  factory ProductCollectionData.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCollectionDataToJson(this);
}
