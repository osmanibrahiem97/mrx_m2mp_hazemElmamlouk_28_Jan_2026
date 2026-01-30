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

import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_download_shipment_mp_model/seller_download_shipment_mp_model.dart';
import '../../../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';

abstract class SellerInvoiceScreenMpState extends Equatable {
  const SellerInvoiceScreenMpState();

  @override
  List<Object> get props => [];
}

class SellerInvoiceScreenMpInitial extends SellerInvoiceScreenMpState{}

class SellerInvoiceScreenMpSuccess extends SellerInvoiceScreenMpState{
  SellerInvoiceScreenMpModel? model;
  SellerInvoiceScreenMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class SellerInvoiceMailSentMpSuccess extends SellerInvoiceScreenMpState{
  BaseModel? model;
  SellerInvoiceMailSentMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class SellerDownloadInvoiceMpSuccess extends SellerInvoiceScreenMpState{
  SellerDownloadShipmentMpModel? model;
  SellerDownloadInvoiceMpSuccess(this.model);

  @override
  List<Object> get props => [];
}

class SaveInvoiceMpSuccessState extends SellerInvoiceScreenMpState{
  const SaveInvoiceMpSuccessState(this.response);
  final BaseModel response;

  @override
  List<Object> get props => [];
}

class SellerInvoiceScreenMpError extends SellerInvoiceScreenMpState{
  final String message;
  const SellerInvoiceScreenMpError(this.message);
}




