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
part 'customer_detail_mp_model.g.dart';

@JsonSerializable()
class CustomerDetailMpModel {
  String? name;
  String? date;
  String? baseTotal;
  String? purchaseTotal;

  CustomerDetailMpModel(
      {this.name, this.date, this.baseTotal, this.purchaseTotal});

  factory CustomerDetailMpModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailMpModelToJson(this);
}
