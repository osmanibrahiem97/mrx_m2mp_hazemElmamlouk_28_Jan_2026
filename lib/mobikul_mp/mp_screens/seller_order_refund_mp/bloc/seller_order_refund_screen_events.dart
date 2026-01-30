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

abstract class SellerOrderRefundScreenEvent extends Equatable{
  const SellerOrderRefundScreenEvent();

  @override
  List<Object> get props => [];
}

class SellerOrderRefundScreenDataFetchEvent extends SellerOrderRefundScreenEvent{
  final String page;
  const SellerOrderRefundScreenDataFetchEvent(this.page);
}

class SellerOrderRefundDetailsFetchEvent extends SellerOrderRefundScreenEvent{
  final String invoiceId;
  const SellerOrderRefundDetailsFetchEvent(this.invoiceId);
}

class DownloadRefundEvent extends SellerOrderRefundScreenEvent{
  final String? incrementId;
  final String? invoiceId;

  const DownloadRefundEvent(this.incrementId,this.invoiceId);

  @override
  List<Object> get props => [];

}
