// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mp_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionMpItemModel _$TransactionMpItemModelFromJson(
        Map<String, dynamic> json) =>
    TransactionMpItemModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      amount: json['amount'] as String?,
      comment: json['comment'] as String?,
      transactionId: json['transactionId'] as String?,
      showRemark: json['showRemark'] as bool?,
    );

Map<String, dynamic> _$TransactionMpItemModelToJson(
        TransactionMpItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'amount': instance.amount,
      'comment': instance.comment,
      'transactionId': instance.transactionId,
      'showRemark': instance.showRemark,
    };
