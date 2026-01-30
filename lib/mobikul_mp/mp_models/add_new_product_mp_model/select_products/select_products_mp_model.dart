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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/filter_data.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';

part 'select_products_mp_model.g.dart';

@JsonSerializable()
class SelectProductsMpModel extends BaseModel {
  List<FilterOption>? filterOption;
  int? totalCount;
  List<ProductCollectionData>? productCollectionData;

  SelectProductsMpModel({
    this.filterOption,
    this.totalCount,
    this.productCollectionData,
  });

  factory SelectProductsMpModel.fromJson(Map<String, dynamic> json) =>
      _$SelectProductsMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectProductsMpModelToJson(this);
}
