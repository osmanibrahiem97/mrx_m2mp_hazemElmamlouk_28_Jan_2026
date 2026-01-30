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
import '../../../mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';

abstract class SellerOrderNewCreditmemoScreenMpState extends Equatable {
  const SellerOrderNewCreditmemoScreenMpState();

  @override
  List<Object> get props => [];
}

class SellerOrderNewCreditmemoScreenMpInitial extends SellerOrderNewCreditmemoScreenMpState{}

class SellerOrderNewCreditmemoScreenMpSuccess extends SellerOrderNewCreditmemoScreenMpState{
  SellerOrdersCreditmemoMpModel? model;
  SellerOrderNewCreditmemoScreenMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class RefundOnlineMpSuccessState extends SellerOrderNewCreditmemoScreenMpState{
  const RefundOnlineMpSuccessState(this.response);
  final BaseModel response;

  @override
  List<Object> get props => [];
}


class SellerOrderNewCreditmemoScreenMpError extends SellerOrderNewCreditmemoScreenMpState{
  final String message;
  const SellerOrderNewCreditmemoScreenMpError(this.message);
}

class CreateCreditMemoSuccessState extends SellerOrderNewCreditmemoScreenMpState{
  const CreateCreditMemoSuccessState(this.response,  this.message);
  final BaseModel response;
  final String message;

  @override
  List<Object> get props => [];
}


class CreateCreditMemoScreenMpError extends SellerOrderNewCreditmemoScreenMpState{
  final String message;
  const CreateCreditMemoScreenMpError(this.message);
}




