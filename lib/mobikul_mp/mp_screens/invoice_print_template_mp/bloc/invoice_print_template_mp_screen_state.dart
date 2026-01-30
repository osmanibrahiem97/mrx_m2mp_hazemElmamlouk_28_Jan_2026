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
import 'package:test_new/mobikul/models/base_model.dart';
import '../../../mp_models/invoice_print_template_mp/invoice_mp_model.dart';

abstract class InvoicePrintTemplateMpState extends Equatable {
  const InvoicePrintTemplateMpState();

  @override
  List<Object> get props => [];
}

class InvoicePrintTemplateMpInitial extends InvoicePrintTemplateMpState {}

class InvoicePrintTemplateMpSuccess extends InvoicePrintTemplateMpState {
  final InvoiceMpModel data;
  const InvoicePrintTemplateMpSuccess(this.data);
}

class InvoicePrintTemplateMpSaveState extends InvoicePrintTemplateMpState {
  final BaseModel data;
  const InvoicePrintTemplateMpSaveState(this.data);
}

class InvoicePrintTemplateMpError extends InvoicePrintTemplateMpState {
  final String message;
  const InvoicePrintTemplateMpError(this.message);
}
