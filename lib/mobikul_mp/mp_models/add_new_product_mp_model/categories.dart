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
part 'categories.g.dart';

@JsonSerializable()
class Categories {
  @JsonKey(name: "category_id")
  String? categoryId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "children")
  List<Categories>? children;
  @JsonKey(name: "isChecked")
  bool? isChecked;

  Categories({this.categoryId, this.name, this.children, this.isChecked});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
