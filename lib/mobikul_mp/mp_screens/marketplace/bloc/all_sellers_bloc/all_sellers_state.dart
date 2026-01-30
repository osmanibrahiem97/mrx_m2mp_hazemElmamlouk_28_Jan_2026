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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/all_sellers/all_sellers_model.dart';

abstract class AllSellersState extends Equatable {
  const AllSellersState();

  @override
  List<Object> get props => [];
}

class AllSellersInitial extends AllSellersState {}

class AllSellersSuccess extends AllSellersState {
  final AllSellersModel allSellersModel;
  const AllSellersSuccess(this.allSellersModel);
}

class AllSellersError extends AllSellersState {
  final String message;
  const AllSellersError(this.message);
}
