// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionMpModel _$TransactionMpModelFromJson(Map<String, dynamic> json) =>
    TransactionMpModel(
      totalSellerEarning: json['totalSellerEarning'] as String?,
      unformattedTotalSellerEarning:
          (json['unformattedTotalSellerEarning'] as num?)?.toDouble(),
      totalSale: json['totalSale'] as String?,
      unformattedTotalSale: (json['unformattedTotalSale'] as num?)?.toDouble(),
      totalTax: json['totalTax'] as String?,
      unformattedTotalTax: (json['unformattedTotalTax'] as num?)?.toInt(),
      totalCommission: json['totalCommission'] as String?,
      unformattedTotalCommission:
          (json['unformattedTotalCommission'] as num?)?.toDouble(),
      totalPayout: json['totalPayout'] as String?,
      unformattedTotalPayout:
          (json['unformattedTotalPayout'] as num?)?.toDouble(),
      remainingPayout: json['remainingPayout'] as String?,
      unformattedRemainingPayout:
          (json['unformattedRemainingPayout'] as num?)?.toDouble(),
      isWithdrawalEligible: (json['isWithdrawalEligible'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      transactionList: (json['transactionList'] as List<dynamic>?)
          ?.map(
              (e) => TransactionMpItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      remainingTransactionAmount: json['remainingTransactionAmount'] as String?,
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$TransactionMpModelToJson(TransactionMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'totalSellerEarning': instance.totalSellerEarning,
      'unformattedTotalSellerEarning': instance.unformattedTotalSellerEarning,
      'totalSale': instance.totalSale,
      'unformattedTotalSale': instance.unformattedTotalSale,
      'totalTax': instance.totalTax,
      'unformattedTotalTax': instance.unformattedTotalTax,
      'totalCommission': instance.totalCommission,
      'unformattedTotalCommission': instance.unformattedTotalCommission,
      'totalPayout': instance.totalPayout,
      'unformattedTotalPayout': instance.unformattedTotalPayout,
      'remainingPayout': instance.remainingPayout,
      'unformattedRemainingPayout': instance.unformattedRemainingPayout,
      'isWithdrawalEligible': instance.isWithdrawalEligible,
      'totalCount': instance.totalCount,
      'transactionList': instance.transactionList,
      'remainingTransactionAmount': instance.remainingTransactionAmount,
    };
