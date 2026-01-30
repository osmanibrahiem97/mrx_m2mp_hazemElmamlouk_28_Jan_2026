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
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/bloc/seller_order_view_refund_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/bloc/seller_order_view_refund_screen_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/bloc/seller_order_view_refund_screen_mp_state.dart';


class SellerOrderViewRefundScreenMpBloc extends Bloc<SellerOrderViewRefundScreenMpEvent, SellerOrderViewRefundScreenMpState> {
  SellerOrderViewRefundScreenRepositoryImp? repository;

  SellerOrderViewRefundScreenMpBloc({this.repository}) : super(SellerOrderViewRefundScreenMpInitial()) {
    on<SellerOrderViewRefundScreenMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerOrderViewRefundScreenMpEvent event, Emitter<SellerOrderViewRefundScreenMpState> emit) async {
    if (event is SellerOrderViewRefundDetailsMpFetchEvent) {
      emit(SellerOrderViewRefundScreenMpInitial());
      try {
        var model = await repository?.getSellerOrderViewRefundList(event.incrementId, event.creditmemoId);
        if (model != null) {
          emit(SellerOrderViewRefundScreenMpSuccess(model));
        } else {
          emit(const SellerOrderViewRefundScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderViewRefundScreenMpError(error.toString()));
      }
    } else if (event is SellerOrderSentMailMpFetchEvent) {
      emit(SellerOrderViewRefundScreenMpInitial());
      try {
        var model = await repository?.getSellerSentEmail(event.incrementId, event.creditmemoId);
        if (model != null) {
          emit(SellerRefundSentScreenMpSuccess(model));
        } else {
          emit(const SellerOrderViewRefundScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderViewRefundScreenMpError(error.toString()));
      }
    }
  }
}
