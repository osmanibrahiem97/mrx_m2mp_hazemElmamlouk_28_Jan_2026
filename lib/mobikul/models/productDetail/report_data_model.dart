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
import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/productDetail/seller_flag_reasons_model.dart';

part 'report_data_model.g.dart';

@JsonSerializable()
class ReportDataModel {
  bool? showReportProduct;
  bool? guestCanReport;
  bool? showReportReason;
  String? productReportLabel;
  bool? showReportOtherReason;
  String? productOtherReasonLabel;
  List<SellerFlagReasonsModel>? productFlagReasons;


  ReportDataModel(
      {this.showReportProduct,
        this.guestCanReport,
        this.showReportReason,
        this.productReportLabel,
        this.showReportOtherReason,
        this.productOtherReasonLabel,
        this.productFlagReasons});

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataModelToJson(this);
}