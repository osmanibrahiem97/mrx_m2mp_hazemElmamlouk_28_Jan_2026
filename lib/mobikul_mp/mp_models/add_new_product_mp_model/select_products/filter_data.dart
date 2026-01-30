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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/options.dart';

part 'filter_data.g.dart';

@JsonSerializable()
class FilterOption {
  String? id;
  String? name;
  String? type;
  List<Options>? options;

  FilterOption({this.id, this.name, this.type, this.options});


  factory FilterOption.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionFromJson(json);

  Map<String, dynamic> toJson() => _$FilterOptionToJson(this);
}