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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/customer_detail_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/product_names_mp_model.dart';
part 'recent_order_mp_model.g.dart';

@JsonSerializable()
class RecentOrderMpModel {
  String? orderId;
  String? incrementId;
  int? qtyOrdered;
  int? qtyInvoiced;
  int? qtyShipped;
  int? qtyCanceled;
  int? qtyRefunded;
  List<ProductNamesMpModel>? productNames;
  String? status;
  String? statusColorCode;
  CustomerDetailMpModel? customerDetails;

  RecentOrderMpModel(
      {this.orderId,
      this.incrementId,
      this.qtyOrdered,
      this.qtyInvoiced,
      this.qtyShipped,
      this.qtyCanceled,
      this.qtyRefunded,
      this.productNames,
      this.status,
      this.statusColorCode,
      this.customerDetails});

  factory RecentOrderMpModel.fromJson(Map<String, dynamic> json) =>
      _$RecentOrderMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentOrderMpModelToJson(this);
}
