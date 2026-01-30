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
import 'package:test_new/mobikul/models/base_model.dart';

import '../../../mp_models/seller_products_mp/seller_products_list_mp_model.dart';


abstract class SellerProductsMpState extends Equatable {
  const SellerProductsMpState();

  @override
  List<Object> get props => [];
}

class SellerProductsMpInitial extends SellerProductsMpState {}

class SellerProductsMpSuccess extends SellerProductsMpState {
  final SellerProductsListMpModel response;
  const SellerProductsMpSuccess(this.response);
}

class SellerDeleteProductSuccess extends SellerProductsMpState {
  final BaseModel response;
  final int index;
  const SellerDeleteProductSuccess(this.response, this.index);
}

class SellerProductsMpError extends SellerProductsMpState {
  final String message;
  const SellerProductsMpError(this.message);
}

class SellerProductsMpEmpty extends SellerProductsMpState {}
