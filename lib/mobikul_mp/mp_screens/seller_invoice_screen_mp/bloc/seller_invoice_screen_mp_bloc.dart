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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_state.dart';

import 'seller_invoice_screen_mp_repository.dart';


class SellerInvoiceScreenMpBloc extends Bloc<SellerInvoiceScreenMpEvent, SellerInvoiceScreenMpState> {
  SellerInvoiceScreenRepositoryImp? repository;

  SellerInvoiceScreenMpBloc({this.repository}) : super(SellerInvoiceScreenMpInitial()) {
    on<SellerInvoiceScreenMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerInvoiceScreenMpEvent event, Emitter<SellerInvoiceScreenMpState> emit) async {
    if (event is SellerInvoiceDetailsMpFetchEvent) {
      emit(SellerInvoiceScreenMpInitial());
      try {
        var model = await repository?.getSellerInvoiceView(event.increementId, event.invoiceId);
        if (model != null) {
          emit(SellerInvoiceScreenMpSuccess(model));
        } else {
          emit(const SellerInvoiceScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerInvoiceScreenMpError(error.toString()));
      }
    }
    if (event is SellerInvoiceSentEmailMpFetchEvent) {
      emit(SellerInvoiceScreenMpInitial());
      try {
        var model = await repository?.getSendinvoice(event.increementId, event.invoiceId);
        if (model != null) {
          emit(SellerInvoiceMailSentMpSuccess(model));
        } else {
          emit(const SellerInvoiceScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerInvoiceScreenMpError(error.toString()));
      }
    }

    if (event is DownloadAllInvoiceEvent) {
      emit(SellerInvoiceScreenMpInitial());
      try {
        var model = await repository?.getDownloadAllInvoiceView(event.incrementId, event.invoiceId);
        if (model != null) {
          emit(SellerDownloadInvoiceMpSuccess(model));
        } else {
          emit(const SellerInvoiceScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerInvoiceScreenMpError(error.toString()));
      }
    }
  }
}
