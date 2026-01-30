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
import 'package:test_new/mobikul/models/order_details/order_detail_model.dart';

import '../../../../mobikul/models/invoice_view/download_invoice_model.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

abstract class SellerOrderRefundScreenState extends Equatable {
  const SellerOrderRefundScreenState();

  @override
  List<Object> get props => [];
}

class SellerOrderRefundScreenInitial extends SellerOrderRefundScreenState{}

class SellerOrderRefundScreenSuccess extends SellerOrderRefundScreenState{
  final CreditMemoListData creditmemoListData;
  const SellerOrderRefundScreenSuccess(this.creditmemoListData);
}

class SellerOrderRefundScreenError extends SellerOrderRefundScreenState{
  final String message;
  const SellerOrderRefundScreenError(this.message);
}

class DownloadRefundSuccess extends SellerOrderRefundScreenState{
  DownloadInvoiceModel? model;
  DownloadRefundSuccess(this.model);

  @override
  List<Object> get props => [];
}

class RefundScreenEmptyState extends SellerOrderRefundScreenState{}




