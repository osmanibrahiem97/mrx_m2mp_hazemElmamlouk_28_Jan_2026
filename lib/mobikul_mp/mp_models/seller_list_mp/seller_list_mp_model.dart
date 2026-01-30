
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
part 'seller_list_mp_model.g.dart';

@JsonSerializable()
class SellerListMpModel extends BaseModel {

  @JsonKey(name:"apiKey")
  String? apiKey;

  @JsonKey(name:"sellerList")
  List<SellerListData>? sellerList;

  SellerListMpModel({this.sellerList,this.apiKey});

  factory SellerListMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerListMpModelToJson(this);

}


@JsonSerializable()
class SellerListData {
  @JsonKey(name:"customerId")
  int? customerId;

  @JsonKey(name:"customerToken")
  String? customerToken;

  @JsonKey(name:"token")
  String? token;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"email")
  String? email;

  @JsonKey(name:"profileImage")
  String? profileImage;

  SellerListData({this.name,this.customerId,this.customerToken,this.profileImage,this.token,this.email});

  factory SellerListData.fromJson(Map<String, dynamic> json) =>
      _$SellerListDataFromJson(json);

  Map<String, dynamic> toJson() => _$SellerListDataToJson(this);

}