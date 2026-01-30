// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_order_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentOrderMpModel _$RecentOrderMpModelFromJson(Map<String, dynamic> json) =>
    RecentOrderMpModel(
      orderId: json['orderId'] as String?,
      incrementId: json['incrementId'] as String?,
      qtyOrdered: (json['qtyOrdered'] as num?)?.toInt(),
      qtyInvoiced: (json['qtyInvoiced'] as num?)?.toInt(),
      qtyShipped: (json['qtyShipped'] as num?)?.toInt(),
      qtyCanceled: (json['qtyCanceled'] as num?)?.toInt(),
      qtyRefunded: (json['qtyRefunded'] as num?)?.toInt(),
      productNames: (json['productNames'] as List<dynamic>?)
          ?.map((e) => ProductNamesMpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      statusColorCode: json['statusColorCode'] as String?,
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetailMpModel.fromJson(
              json['customerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentOrderMpModelToJson(RecentOrderMpModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'incrementId': instance.incrementId,
      'qtyOrdered': instance.qtyOrdered,
      'qtyInvoiced': instance.qtyInvoiced,
      'qtyShipped': instance.qtyShipped,
      'qtyCanceled': instance.qtyCanceled,
      'qtyRefunded': instance.qtyRefunded,
      'productNames': instance.productNames,
      'status': instance.status,
      'statusColorCode': instance.statusColorCode,
      'customerDetails': instance.customerDetails,
    };
