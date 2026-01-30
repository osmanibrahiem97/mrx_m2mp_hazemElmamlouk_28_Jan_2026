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
import 'package:test_new/mobikul/screens/refund_screen/bloc/refund_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/bloc/seller_order_refund_screen_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/bloc/seller_order_refund_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/bloc/seller_order_refund_screen_state.dart';




class SellerOrderRefundScreenBloc extends Bloc<SellerOrderRefundScreenEvent, SellerOrderRefundScreenState> {
  SellerOrderRefundScreenRepositoryImp? repository;

  SellerOrderRefundScreenBloc({this.repository}) : super(SellerOrderRefundScreenInitial()) {
    on<SellerOrderRefundScreenEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerOrderRefundScreenEvent event, Emitter<SellerOrderRefundScreenState> emit) async {
    if (event is SellerOrderRefundScreenDataFetchEvent) {
      emit(SellerOrderRefundScreenInitial());
      try {
        var model = await repository?.getInvoiceList(event.page);
        if (model != null) {
          emit(SellerOrderRefundScreenSuccess(model));
        } else {
          emit (SellerOrderRefundScreenError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderRefundScreenError(error.toString()));
      }
    }
    if (event is DownloadRefundEvent) {
      try {
        var model = await repository?.getDownloadUrl(event.incrementId, event.invoiceId);
        if (model != null) {
          emit(DownloadRefundSuccess(model));
        } else {
          emit(const SellerOrderRefundScreenError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderRefundScreenError(error.toString()));
      }
    }
  }
}
