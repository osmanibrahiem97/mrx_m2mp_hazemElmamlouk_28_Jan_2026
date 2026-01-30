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

abstract class TransactionMpEvent extends Equatable {
  const TransactionMpEvent();

  @override
  List<Object> get props => [];
}

class TransactionFetchEvent extends TransactionMpEvent {
  final String transactionId;
  final String dateFrom;
  final String dateTo;
  final int page;
  const TransactionFetchEvent(this.transactionId, this.dateFrom, this.dateTo, this.page);
}

class RequestWithdrawalEvent extends TransactionMpEvent {
  const RequestWithdrawalEvent();
}

class TransactionDownloadEvent extends TransactionMpEvent {
  final String dateTo;
  final String dateFrom;
  final int pageNumber;
  final String transactionId;
  const TransactionDownloadEvent(this.dateTo, this.dateFrom, this.pageNumber, this.transactionId);
}
