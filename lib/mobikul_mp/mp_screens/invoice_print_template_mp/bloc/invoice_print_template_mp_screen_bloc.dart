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

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_state.dart';

class InvoicePrintTemplateMpBloc
    extends Bloc<InvoicePrintTemplateMpEvent, InvoicePrintTemplateMpState> {
  InvoicePrintTemplateMpRepositoryImp? repository;

  InvoicePrintTemplateMpBloc({this.repository})
      : super(InvoicePrintTemplateMpInitial()) {
    on<InvoicePrintTemplateMpEvent>(mapEventToState);
  }

  void mapEventToState(InvoicePrintTemplateMpEvent event,
      Emitter<InvoicePrintTemplateMpState> emit) async {
    if (event is InvoicePrintTemplateMpFetchEvent) {
      emit(InvoicePrintTemplateMpInitial());
      try {
        var model = await repository?.getInvoicePrintTemplateMpData();
        if (model != null) {
          if (model.success ?? false) {
            emit(InvoicePrintTemplateMpSuccess(model));
          } else {
            emit(InvoicePrintTemplateMpError(model.message.toString()));
          }
        } else {
          emit(const InvoicePrintTemplateMpError(
              MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(InvoicePrintTemplateMpError(error.toString()));
      }
    } else if (event is InvoicePrintTemplateMpSaveEvent) {
      emit(InvoicePrintTemplateMpInitial());
      try {
        var model = await repository?.savePrintTemplateMpData(event.pdfHeader);
        if (model != null) {
          if (model.success ?? false) {
            emit(InvoicePrintTemplateMpSaveState(model));
          } else {
            emit(InvoicePrintTemplateMpError(model.message.toString()));
          }
        } else {
          emit(const InvoicePrintTemplateMpError(
              MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(InvoicePrintTemplateMpError(error.toString()));
      }
    }
  }
}
