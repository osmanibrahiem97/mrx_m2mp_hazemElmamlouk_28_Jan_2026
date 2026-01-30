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
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

abstract class TransactionDetailMpState extends Equatable {
  const TransactionDetailMpState();

  @override
  List<Object> get props => [];
}

class TransactionDetailMpInitial extends TransactionDetailMpState {}

class TransactionDetailMpSuccess extends TransactionDetailMpState {
  final TransactionDetailMpModel transactionDetailMpModel;
  const TransactionDetailMpSuccess(this.transactionDetailMpModel);
}

class TransactionDetailMpError extends TransactionDetailMpState {
  final String message;
  const TransactionDetailMpError(this.message);
}
