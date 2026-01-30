/*
* Webkul Software.
*
@package Mobikul Application Code.
* @Category Mobikul
* @author Webkul <support@webkul.com>
* @Copyright (c) Webkul Software Private Limited (https://webkul.com)
* @license https://store.webkul.com/license.html
* @link https://store.webkul.com/license.html
*
*/


import 'package:test_new/mobikul/models/seller_menu_model/seller_menu_list.dart';

import '../base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'seller_menu_model_data.g.dart';


@JsonSerializable()
class SellerMenuData extends BaseModel {
  @JsonKey(name:"menus")
  List<SellerMenuList>? sellermenu;

  SellerMenuData({this.sellermenu});


  factory SellerMenuData.fromJson(Map<String, dynamic> json) =>
      _$SellerMenuDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerMenuDataToJson(this);
}
