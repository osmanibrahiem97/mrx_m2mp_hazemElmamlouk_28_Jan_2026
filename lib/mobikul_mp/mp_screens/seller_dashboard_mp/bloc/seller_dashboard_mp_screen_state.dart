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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

abstract class SellerDashboardMpState extends Equatable {
  const SellerDashboardMpState();

  @override
  List<Object> get props => [];
}

class SellerDashboardMpInitial extends SellerDashboardMpState {}

class SellerDashboardMpSuccess extends SellerDashboardMpState {
  final SellerDashboardMpModel sellerDashboardMpModel;
  const SellerDashboardMpSuccess(this.sellerDashboardMpModel);
}

class SellerDashboardMpError extends SellerDashboardMpState {
  final String message;
  const SellerDashboardMpError(this.message);
}

class SellerDashboardMpCompleteState extends SellerDashboardMpState {}