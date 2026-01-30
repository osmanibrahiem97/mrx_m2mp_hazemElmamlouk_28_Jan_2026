// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_dashboard_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerDashboardMpModel _$SellerDashboardMpModelFromJson(
        Map<String, dynamic> json) =>
    SellerDashboardMpModel(
      dailySalesLocationReport: json['dailySalesLocationReport'] as String?,
      yearlySalesLocationReport: json['yearlySalesLocationReport'] as String?,
      monthlySalesLocationReport: json['monthlySalesLocationReport'] as String?,
      weeklySalesLocationReport: json['weeklySalesLocationReport'] as String?,
      salesStats: json['salesStats'] as String?,
      dailySalesStats: json['dailySalesStats'] as String?,
      weeklySalesStats: json['weeklySalesStats'] as String?,
      yearlySalesStats: json['yearlySalesStats'] as String?,
      monthlySalesStats: json['monthlySalesStats'] as String?,
      totalPayout: json['totalPayout'] as String?,
      lifetimeSale: json['lifetimeSale'] as String?,
      remainingAmount: json['remainingAmount'] as String?,
      topSellingProducts: (json['topSellingProducts'] as List<dynamic>?)
          ?.map((e) =>
              TopSellingProductMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryChart: json['categoryChart'] as String?,
      recentOrderList: (json['recentOrderList'] as List<dynamic>?)
          ?.map((e) => RecentOrderMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewList: (json['reviewList'] as List<dynamic>?)
          ?.map((e) => ReviewListMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$SellerDashboardMpModelToJson(
        SellerDashboardMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'dailySalesLocationReport': instance.dailySalesLocationReport,
      'yearlySalesLocationReport': instance.yearlySalesLocationReport,
      'monthlySalesLocationReport': instance.monthlySalesLocationReport,
      'weeklySalesLocationReport': instance.weeklySalesLocationReport,
      'salesStats': instance.salesStats,
      'dailySalesStats': instance.dailySalesStats,
      'weeklySalesStats': instance.weeklySalesStats,
      'yearlySalesStats': instance.yearlySalesStats,
      'monthlySalesStats': instance.monthlySalesStats,
      'totalPayout': instance.totalPayout,
      'lifetimeSale': instance.lifetimeSale,
      'remainingAmount': instance.remainingAmount,
      'topSellingProducts': instance.topSellingProducts,
      'categoryChart': instance.categoryChart,
      'recentOrderList': instance.recentOrderList,
      'reviewList': instance.reviewList,
    };
