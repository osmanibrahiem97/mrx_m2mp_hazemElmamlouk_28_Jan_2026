// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_mp_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMpItemModel _$CustomerMpItemModelFromJson(Map<String, dynamic> json) =>
    CustomerMpItemModel(
      customerName: json['customerName'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerAddress: json['customerAddress'] as String?,
      customerTelephone: json['customerTelephone'] as String?,
      customerBaseTotal: json['customerBaseTotal'] as String?,
      customerOrderCount: json['customerOrderCount'] as String?,
      customerGender: json['customerGender'] as String?,
    );

Map<String, dynamic> _$CustomerMpItemModelToJson(
        CustomerMpItemModel instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerAddress': instance.customerAddress,
      'customerTelephone': instance.customerTelephone,
      'customerBaseTotal': instance.customerBaseTotal,
      'customerOrderCount': instance.customerOrderCount,
      'customerGender': instance.customerGender,
    };
