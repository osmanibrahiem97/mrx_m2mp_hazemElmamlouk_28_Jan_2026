// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_data_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDataMpModel _$ReportDataMpModelFromJson(Map<String, dynamic> json) =>
    ReportDataMpModel(
      showReportSeller: json['showReportSeller'] as bool?,
      guestCanReport: json['guestCanReport'] as bool?,
      showReportReason: json['showReportReason'] as bool?,
      sellerReportLabel: json['sellerReportLabel'] as String?,
      showReportOtherReason: json['showReportOtherReason'] as bool?,
      sellerOtherReportLabel: json['sellerOtherReportLabel'] as String?,
      sellerFlagReasons: (json['sellerFlagReasons'] as List<dynamic>?)
          ?.map((e) =>
              SellerFlagReasonsMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportDataMpModelToJson(ReportDataMpModel instance) =>
    <String, dynamic>{
      'showReportSeller': instance.showReportSeller,
      'guestCanReport': instance.guestCanReport,
      'showReportReason': instance.showReportReason,
      'sellerReportLabel': instance.sellerReportLabel,
      'showReportOtherReason': instance.showReportOtherReason,
      'sellerOtherReportLabel': instance.sellerOtherReportLabel,
      'sellerFlagReasons': instance.sellerFlagReasons,
    };
