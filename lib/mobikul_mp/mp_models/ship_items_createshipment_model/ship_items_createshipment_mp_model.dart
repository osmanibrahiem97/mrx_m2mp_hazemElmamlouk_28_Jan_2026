/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'package:json_annotation/json_annotation.dart';

import '../../../mobikul/models/base_model.dart';
part 'ship_items_createshipment_mp_model.g.dart';


@JsonSerializable()
class ShipItemsCreateshipmentMpModel{

  dynamic? shipmentId;
  dynamic? success;
  String? message;


  ShipItemsCreateshipmentMpModel(this.shipmentId, this.success,
      this.message);


  // success: 1, message: The shipment has been created., shipmentId: 9



  factory ShipItemsCreateshipmentMpModel.fromJson(Map<String, dynamic> json) =>
      _$ShipItemsCreateshipmentMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipItemsCreateshipmentMpModelToJson(this);
}
