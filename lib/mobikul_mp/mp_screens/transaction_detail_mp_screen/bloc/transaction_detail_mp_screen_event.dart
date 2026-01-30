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

abstract class TransactionDetailMpEvent extends Equatable {
  const TransactionDetailMpEvent();

  @override
  List<Object> get props => [];
}

class TransactionDetailMpFetchEvent extends TransactionDetailMpEvent {
  final String transactionId;
  const TransactionDetailMpFetchEvent(this.transactionId);
}
