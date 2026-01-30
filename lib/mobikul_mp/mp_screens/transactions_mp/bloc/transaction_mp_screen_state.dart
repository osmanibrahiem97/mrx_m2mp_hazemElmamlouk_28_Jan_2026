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
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

import '../../../mp_models/transaction_mp/transaction_download_mp_model.dart';

abstract class TransactionMpState {
  const TransactionMpState();

  @override
  List<Object> get props => [];
}

class TransactionMpInitial extends TransactionMpState {
}

class TransactionMpSuccess extends TransactionMpState {
  final TransactionMpModel transactionMpModel;
  const TransactionMpSuccess(this.transactionMpModel);
}

class RequestWithdrawalState extends TransactionMpState {
  final BaseModel response;
  const RequestWithdrawalState(this.response);
}

class TransactionMpError extends TransactionMpState {
  final String message;
  const TransactionMpError(this.message);
}

class TransactionDownloadSuccessState extends TransactionMpState {
  final TransactionDownloadMpModel response;
  const TransactionDownloadSuccessState(this.response);
}

class TransactionMpEmptyState extends TransactionMpState {}