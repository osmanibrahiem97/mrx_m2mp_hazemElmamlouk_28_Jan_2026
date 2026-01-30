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

abstract class SellerInvoiceScreenMpEvent extends Equatable{
  const SellerInvoiceScreenMpEvent();

  @override
  List<Object> get props => [];
}

class SellerInvoiceDetailsMpFetchEvent extends SellerInvoiceScreenMpEvent{
  final String? increementId;
  final String? invoiceId;
  const SellerInvoiceDetailsMpFetchEvent(this.increementId, this.invoiceId);
}
class SellerInvoiceSentEmailMpFetchEvent extends SellerInvoiceScreenMpEvent{
  final String? increementId;
  final String? invoiceId;
  const SellerInvoiceSentEmailMpFetchEvent(this.increementId, this.invoiceId);
}

class SaveInvoiceEvent extends SellerInvoiceScreenMpEvent{
  final String? invoiceId;

  const SaveInvoiceEvent(this.invoiceId);

  @override
  List<Object> get props => [];

}

class DownloadAllInvoiceEvent extends SellerInvoiceScreenMpEvent{
  final String? incrementId;
  final String? invoiceId;

  const DownloadAllInvoiceEvent(this.incrementId,this.invoiceId);

  @override
  List<Object> get props => [];

}