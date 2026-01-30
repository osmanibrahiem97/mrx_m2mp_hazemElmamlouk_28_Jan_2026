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

import '../base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'seller_menu_list.g.dart';


@JsonSerializable()
class SellerMenuList  {

  @JsonKey(name:"label")
  String? label;

  @JsonKey(name:"code")
  String? code;


  SellerMenuList({this.label,this.code});


  factory SellerMenuList.fromJson(Map<String, dynamic> json) =>
      _$SellerMenuListFromJson(json);

  Map<String, dynamic> toJson() => _$SellerMenuListToJson(this);
}