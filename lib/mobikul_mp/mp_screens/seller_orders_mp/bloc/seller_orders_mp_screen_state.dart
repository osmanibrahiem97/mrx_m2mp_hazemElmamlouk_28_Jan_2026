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

import '../../../mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';

abstract class SellerOrdersMpState extends Equatable {
  const SellerOrdersMpState();

  @override
  List<Object> get props => [];
}

class SellerOrdersMpInitial extends SellerOrdersMpState {}

class SellerOrdersMpSuccess extends SellerOrdersMpState {
  final SellerOrderListMpModel sellerOrderListMpModel;
  const SellerOrdersMpSuccess(this.sellerOrderListMpModel);
}

class SellerOrdersMpError extends SellerOrdersMpState {
  final String message;
  const SellerOrdersMpError(this.message);
}
