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

part 'invoice_mp_model.g.dart';

@JsonSerializable()
class InvoiceMpModel extends BaseModel {
  String? headerInfo;

  InvoiceMpModel({this.headerInfo});

  factory InvoiceMpModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceMpModelToJson(this);
}
