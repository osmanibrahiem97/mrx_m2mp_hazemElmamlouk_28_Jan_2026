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
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

abstract class CustomerMpState extends Equatable {
  const CustomerMpState();

  @override
  List<Object> get props => [];
}

class CustomerMpInitial extends CustomerMpState {}

class CustomerMpSuccess extends CustomerMpState {
  final CustomerMpModel customerMpModel;
  const CustomerMpSuccess(this.customerMpModel);
}

class CustomerMpError extends CustomerMpState {
  final String message;
  const CustomerMpError(this.message);
}
