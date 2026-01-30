// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailMpModel _$CustomerDetailMpModelFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailMpModel(
      name: json['name'] as String?,
      date: json['date'] as String?,
      baseTotal: json['baseTotal'] as String?,
      purchaseTotal: json['purchaseTotal'] as String?,
    );

Map<String, dynamic> _$CustomerDetailMpModelToJson(
        CustomerDetailMpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'baseTotal': instance.baseTotal,
      'purchaseTotal': instance.purchaseTotal,
    };
