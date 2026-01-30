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

import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/seller_flag_reasons_mp_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/base_model.dart';

part 'report_data_mp_model.g.dart';

@JsonSerializable()
class ReportDataMpModel {
  bool? showReportSeller;
  bool? guestCanReport;
  bool? showReportReason;
  String? sellerReportLabel;
  bool? showReportOtherReason;
  String? sellerOtherReportLabel;
  @JsonKey(name:"sellerFlagReasons")
  // List<SellerFlagReasonsMpModel>? productFlagReasons;
  List<SellerFlagReasonsMpModel>? sellerFlagReasons;

  ReportDataMpModel({this.showReportSeller, this.guestCanReport, this.showReportReason, this.sellerReportLabel, this.showReportOtherReason, this.sellerOtherReportLabel, this.sellerFlagReasons});


  factory ReportDataMpModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataMpModelToJson(this);
}
