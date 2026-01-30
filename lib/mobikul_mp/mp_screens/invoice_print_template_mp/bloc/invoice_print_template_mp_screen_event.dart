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

abstract class InvoicePrintTemplateMpEvent extends Equatable {
  const InvoicePrintTemplateMpEvent();

  @override
  List<Object> get props => [];
}

class InvoicePrintTemplateMpFetchEvent extends InvoicePrintTemplateMpEvent {
  const InvoicePrintTemplateMpFetchEvent();

  @override
  List<Object> get props => [];
}

class InvoicePrintTemplateMpSaveEvent extends InvoicePrintTemplateMpEvent {
  final String pdfHeader;
  const InvoicePrintTemplateMpSaveEvent(this.pdfHeader);
  @override
  List<Object> get props => [];
}
