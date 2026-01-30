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

import 'package:test_new/mobikul/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_item_model.dart';
part 'customer_mp_model.g.dart';

@JsonSerializable()
class CustomerMpModel extends BaseModel {
  @JsonKey(name: "customerList")
  List<CustomerMpItemModel>? customerList;

  CustomerMpModel({this.customerList});

  factory CustomerMpModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerMpModelToJson(this);
}
