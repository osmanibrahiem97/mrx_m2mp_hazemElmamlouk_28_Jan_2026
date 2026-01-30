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

import 'package:equatable/equatable.dart';

import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_download_shipment_mp_model/seller_download_shipment_mp_model.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';

abstract class SellerOrderShipmentScreenMpState extends Equatable {
  const SellerOrderShipmentScreenMpState();

  @override
  List<Object> get props => [];
}

class SellerOrderShipmentScreenMpInitial extends SellerOrderShipmentScreenMpState{}

class SellerOrderShipmentScreenMpSuccess extends SellerOrderShipmentScreenMpState{
  SellerOrdersShipmentMpModel? model;
  SellerOrderShipmentScreenMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class PrintShipmentMpSuccessState extends SellerOrderShipmentScreenMpState{
  const PrintShipmentMpSuccessState(this.response);
  final BaseModel response;

  @override
  List<Object> get props => [];
}

class SendtrackingInformationSuccess extends SellerOrderShipmentScreenMpState{
  const SendtrackingInformationSuccess(this.model);
  final BaseModel model;

  @override
  List<Object> get props => [];
}

class SellerOrderShipmentScreenMpError extends SellerOrderShipmentScreenMpState{
  final String message;
  const SellerOrderShipmentScreenMpError(this.message);
}

class SellerOrderShipmentScreenSuccess extends SellerOrderShipmentScreenMpState{
  const SellerOrderShipmentScreenSuccess(this.model);
  final SellerDownloadShipmentMpModel model;

  @override
  List<Object> get props => [];
}
class SellerOrderSentMailMpSuccess extends SellerOrderShipmentScreenMpState {
  BaseModel model;
  SellerOrderSentMailMpSuccess(this.model);

  @override
  List<Object> get props => [];
}


