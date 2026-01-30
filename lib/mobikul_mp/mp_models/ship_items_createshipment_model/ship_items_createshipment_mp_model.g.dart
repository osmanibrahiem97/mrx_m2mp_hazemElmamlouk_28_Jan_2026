// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_items_createshipment_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipItemsCreateshipmentMpModel _$ShipItemsCreateshipmentMpModelFromJson(
        Map<String, dynamic> json) =>
    ShipItemsCreateshipmentMpModel(
      json['shipmentId'],
      json['success'],
      json['message'] as String?,
    );

Map<String, dynamic> _$ShipItemsCreateshipmentMpModelToJson(
        ShipItemsCreateshipmentMpModel instance) =>
    <String, dynamic>{
      'shipmentId': instance.shipmentId,
      'success': instance.success,
      'message': instance.message,
    };
