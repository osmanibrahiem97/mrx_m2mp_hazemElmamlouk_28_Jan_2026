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

abstract class SellerOrderViewRefundScreenMpEvent extends Equatable{
  const SellerOrderViewRefundScreenMpEvent();

  @override
  List<Object> get props => [];
}

class SellerOrderViewRefundScreenMpDataFetchEvent extends SellerOrderViewRefundScreenMpEvent{
  final String page;
  const SellerOrderViewRefundScreenMpDataFetchEvent(this.page);
}

class SellerOrderViewRefundDetailsMpFetchEvent extends SellerOrderViewRefundScreenMpEvent{
  final String? creditmemoId;
  final String? incrementId;
  const SellerOrderViewRefundDetailsMpFetchEvent(this.creditmemoId,this.incrementId);
}


class SellerOrderSentMailMpFetchEvent extends SellerOrderViewRefundScreenMpEvent{
  final String? creditmemoId;
  final String? incrementId;
  const SellerOrderSentMailMpFetchEvent(this.creditmemoId,this.incrementId);
}

