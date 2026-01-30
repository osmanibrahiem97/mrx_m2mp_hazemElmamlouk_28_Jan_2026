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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/recent_order_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/review_list_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/top_selling_product_mp_model.dart';

part 'seller_dashboard_mp_model.g.dart';

@JsonSerializable()
class SellerDashboardMpModel extends BaseModel {
  String? dailySalesLocationReport;
  String? yearlySalesLocationReport;
  String? monthlySalesLocationReport;
  String? weeklySalesLocationReport;
  String? salesStats;
  String? dailySalesStats;
  String? weeklySalesStats;
  String? yearlySalesStats;
  String? monthlySalesStats;
  String? totalPayout;
  String? lifetimeSale;
  String? remainingAmount;
  List<TopSellingProductMpModel>? topSellingProducts;
  String? categoryChart;
  List<RecentOrderMpModel>? recentOrderList;
  List<ReviewListMpModel>? reviewList;

  SellerDashboardMpModel({
    this.dailySalesLocationReport,
    this.yearlySalesLocationReport,
    this.monthlySalesLocationReport,
    this.weeklySalesLocationReport,
    this.salesStats,
    this.dailySalesStats,
    this.weeklySalesStats,
    this.yearlySalesStats,
    this.monthlySalesStats,
    this.totalPayout,
    this.lifetimeSale,
    this.remainingAmount,
    this.topSellingProducts,
    this.categoryChart,
    this.recentOrderList,
    this.reviewList,
  });

  factory SellerDashboardMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerDashboardMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerDashboardMpModelToJson(this);
}
