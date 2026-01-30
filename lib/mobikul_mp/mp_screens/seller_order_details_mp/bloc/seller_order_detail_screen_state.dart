
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

part of 'seller_order_detail_screen_bloc.dart';

abstract class SellerOrderDetailMpState extends Equatable{
  const SellerOrderDetailMpState();

  @override
  List<Object> get props => [];
}

class SellerOrderDetailMpInitial extends SellerOrderDetailMpState{

}

class SellerOrderDetailMpSuccess extends SellerOrderDetailMpState{
  SellerOrderDetailsMpModel? model;
  SellerOrderDetailMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class CreateInvoiceMpStateSuccess extends SellerOrderDetailMpState {
  CreateInvoiceMpStateSuccess(this.baseModel);

  BaseModel baseModel;

  @override
  List<Object> get props => [];
}

class CancelInvoiceMpSuccess extends SellerOrderDetailMpState {
  CancelInvoiceMpSuccess(this.baseModel);

  BaseModel baseModel;

  @override
  List<Object> get props => [];
}

class CreateShipmentMpSuccess extends SellerOrderDetailMpState {
  CreateShipmentMpSuccess(this.shipItemsCreateshipmentMpModel);

  ShipItemsCreateshipmentMpModel shipItemsCreateshipmentMpModel;

  @override
  List<Object> get props => [];
}
class OrderSentMailMpSuccess extends SellerOrderDetailMpState {
  BaseModel model;
  OrderSentMailMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class CreateMemoSuccess extends SellerOrderDetailMpState {
  CreateMemoSuccess(this.baseModel);

  BaseModel baseModel;

  @override
  List<Object> get props => [];
}

class SellerOrderDetailMpError extends SellerOrderDetailMpState {
  SellerOrderDetailMpError(this._message);

  String? _message;

  // ignore: unnecessary_getters_setters
  String? get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String? message) {
    _message = message;
  }

  @override
  List<Object> get props => [];
}
class ReorderMpSuccessState extends SellerOrderDetailMpState{
  final BaseModel response;
  const ReorderMpSuccessState(this.response);
}