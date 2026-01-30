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

import '../../../mp_models/creditmemo_mp/create_creditmemorequest_model.dart';

abstract class SellerOrderNewCreditMemoScreenMpEvent extends Equatable{
  const SellerOrderNewCreditMemoScreenMpEvent();

  @override
  List<Object> get props => [];
}

class SellerOrderNewCreditmemoScreenMpFetchEvent extends SellerOrderNewCreditMemoScreenMpEvent{
  final String? increementId;
  final String? invoiceId;
  const SellerOrderNewCreditmemoScreenMpFetchEvent(this.increementId, this.invoiceId);
}

class RefundOnlineEvent extends SellerOrderNewCreditMemoScreenMpEvent{
  final String? increementId;

  const RefundOnlineEvent(this.increementId);

  @override
  List<Object> get props => [];

}
class CreateCreditMemoEvent extends SellerOrderNewCreditMemoScreenMpEvent{
  final String? increementId;
  final String? comment;
  final String? doOffline;
  final String? sendEmail;
  final String? invoiceId;
  final String? shippingAmount;
  final String? isVisibleOnFront;
  final String? adjustmentPositive;
  final String? adjustmentNegative;
  final String? commentCustomerNotify;
  final String? productName;
  final int? productId;
  final String? currencyWithPrice;


  CreateCreditMemoEvent(
      this.increementId,
      this.comment,
      this.doOffline,
      this.sendEmail,
      this.invoiceId,
      this.shippingAmount,
      this.isVisibleOnFront,
      this.adjustmentPositive,
      this.adjustmentNegative,
      this.commentCustomerNotify,
      this.productName,
      this.productId,
      this.currencyWithPrice);

  @override
  List<Object> get props => [];

}