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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';

abstract class SelectProductsMpState extends Equatable {
  const SelectProductsMpState();

  @override
  List<Object> get props => [];
}

class SelectProductsMpInitial extends SelectProductsMpState {}

class SelectProductsMpSuccess extends SelectProductsMpState {
  final String pageType;
  final SelectProductsMpModel selectProductsMpModel;
  const SelectProductsMpSuccess(this.selectProductsMpModel,this.pageType);
}

class SelectProductsMpError extends SelectProductsMpState {
  final String message;
  const SelectProductsMpError(this.message);
}
