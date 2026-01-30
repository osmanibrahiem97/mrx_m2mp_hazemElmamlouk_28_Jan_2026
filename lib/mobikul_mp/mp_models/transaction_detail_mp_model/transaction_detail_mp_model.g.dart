// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetailMpModel _$TransactionDetailMpModelFromJson(
        Map<String, dynamic> json) =>
    TransactionDetailMpModel(
      transactionId: json['transactionId'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      method: json['method'] as String?,
      amount: json['amount'] as String?,
      comment: json['comment'] as String?,
      orderList: (json['orderList'] as List<dynamic>?)
          ?.map((e) =>
              TransactionViewMpItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$TransactionDetailMpModelToJson(
        TransactionDetailMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'transactionId': instance.transactionId,
      'date': instance.date,
      'type': instance.type,
      'method': instance.method,
      'amount': instance.amount,
      'comment': instance.comment,
      'orderList': instance.orderList,
    };
