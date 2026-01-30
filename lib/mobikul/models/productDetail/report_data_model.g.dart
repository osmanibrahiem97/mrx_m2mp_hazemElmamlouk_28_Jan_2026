// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDataModel _$ReportDataModelFromJson(Map<String, dynamic> json) =>
    ReportDataModel(
      showReportProduct: json['showReportProduct'] as bool?,
      guestCanReport: json['guestCanReport'] as bool?,
      showReportReason: json['showReportReason'] as bool?,
      productReportLabel: json['productReportLabel'] as String?,
      showReportOtherReason: json['showReportOtherReason'] as bool?,
      productOtherReasonLabel: json['productOtherReasonLabel'] as String?,
      productFlagReasons: (json['productFlagReasons'] as List<dynamic>?)
          ?.map(
              (e) => SellerFlagReasonsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportDataModelToJson(ReportDataModel instance) =>
    <String, dynamic>{
      'showReportProduct': instance.showReportProduct,
      'guestCanReport': instance.guestCanReport,
      'showReportReason': instance.showReportReason,
      'productReportLabel': instance.productReportLabel,
      'showReportOtherReason': instance.showReportOtherReason,
      'productOtherReasonLabel': instance.productOtherReasonLabel,
      'productFlagReasons': instance.productFlagReasons,
    };
