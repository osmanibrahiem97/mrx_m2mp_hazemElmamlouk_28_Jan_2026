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

import 'package:test_new/mobikul/models/base_model.dart';

import 'package:json_annotation/json_annotation.dart';


part 'seller_download_shipment_mp_model.g.dart';

@JsonSerializable()
class SellerDownloadShipmentMpModel extends BaseModel{

  @JsonKey(name: "url")
  String? url;

  SellerDownloadShipmentMpModel(
      this.url);


  factory SellerDownloadShipmentMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerDownloadShipmentMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerDownloadShipmentMpModelToJson(this);

}