// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_view_mp_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionViewMpItemModel _$TransactionViewMpItemModelFromJson(
        Map<String, dynamic> json) =>
    TransactionViewMpItemModel(
      qty: json['qty'] as String?,
      price: json['price'] as String?,
      totalTax: json['totalTax'] as String?,
      shipping: json['shipping'] as String?,
      totalPrice: json['totalPrice'] as String?,
      commission: json['commission'] as String?,
      incrementId: json['incrementId'] as String?,
      productName: json['productName'] as String?,
      subTotal: json['subTotal'] as String?,
    );

Map<String, dynamic> _$TransactionViewMpItemModelToJson(
        TransactionViewMpItemModel instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'price': instance.price,
      'totalTax': instance.totalTax,
      'shipping': instance.shipping,
      'totalPrice': instance.totalPrice,
      'commission': instance.commission,
      'incrementId': instance.incrementId,
      'productName': instance.productName,
      'subTotal': instance.subTotal,
    };
