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

abstract class SellerOrdersMpEvent extends Equatable {
  const SellerOrdersMpEvent();

  @override
  List<Object> get props => [];
}

class SellerOrdersScreenDataFetchEvent extends SellerOrdersMpEvent{
  final String orderId;
  final String dateFrom;
  final String dateTo;
  final String status;
  final int page;
  const SellerOrdersScreenDataFetchEvent(this.orderId, this.dateFrom, this.dateTo,this.status,this.page);
}


class SellerOrdersMpFetchEvent extends SellerOrdersMpEvent {
  final int page;
  const SellerOrdersMpFetchEvent(this.page);
}
