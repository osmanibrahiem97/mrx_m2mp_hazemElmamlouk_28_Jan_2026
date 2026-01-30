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
part 'customer_mp_item_model.g.dart';

@JsonSerializable()
class CustomerMpItemModel {
  @JsonKey(name: "customerName")
  String? customerName;

  @JsonKey(name: "customerEmail")
  String? customerEmail;

  @JsonKey(name: "customerAddress")
  String? customerAddress;

  @JsonKey(name: "customerTelephone")
  String? customerTelephone;

  @JsonKey(name: "customerBaseTotal")
  String? customerBaseTotal;

  @JsonKey(name: "customerOrderCount")
  String? customerOrderCount;

  @JsonKey(name: "customerGender")
  String? customerGender;

  CustomerMpItemModel(
      {this.customerName,
      this.customerEmail,
      this.customerAddress,
      this.customerTelephone,
      this.customerBaseTotal,
      this.customerOrderCount,
      this.customerGender});

  factory CustomerMpItemModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerMpItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerMpItemModelToJson(this);
}
