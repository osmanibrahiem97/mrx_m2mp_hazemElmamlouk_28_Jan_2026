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
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';
import '../../../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';

abstract class SellerOrderViewRefundScreenMpState extends Equatable {
  const SellerOrderViewRefundScreenMpState();

  @override
  List<Object> get props => [];
}

class SellerOrderViewRefundScreenMpInitial extends SellerOrderViewRefundScreenMpState{}

class SellerRefundSentScreenMpSuccess extends SellerOrderViewRefundScreenMpState{
  BaseModel? model;
  SellerRefundSentScreenMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class SellerOrderViewRefundScreenMpSuccess extends SellerOrderViewRefundScreenMpState{
  SellerOrdersViewRefundMpModel? model;
  SellerOrderViewRefundScreenMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class PrintShipmentMpSuccessState extends SellerOrderViewRefundScreenMpState{
  const PrintShipmentMpSuccessState(this.response);
  final BaseModel response;

  @override
  List<Object> get props => [];
}

class SendtrackingInformationState extends SellerOrderViewRefundScreenMpState{
  const SendtrackingInformationState(this.response);
  final BaseModel response;

  @override
  List<Object> get props => [];
}

class SellerOrderViewRefundScreenMpError extends SellerOrderViewRefundScreenMpState{
  final String message;
  const SellerOrderViewRefundScreenMpError(this.message);
}




