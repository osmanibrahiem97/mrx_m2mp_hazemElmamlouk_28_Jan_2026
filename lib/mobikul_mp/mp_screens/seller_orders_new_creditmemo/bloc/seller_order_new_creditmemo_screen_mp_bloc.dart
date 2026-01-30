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
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/bloc/seller_order_new_creditmemo_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/bloc/seller_order_new_creditmemo_screen_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/bloc/seller_order_new_creditmemo_screen_mp_state.dart';


class SellerOrderNewCreditmemoScreenMpBloc extends Bloc<SellerOrderNewCreditMemoScreenMpEvent, SellerOrderNewCreditmemoScreenMpState> {
  SellerOrderNewCreditmemoScreenRepositoryImp? repository;

  SellerOrderNewCreditmemoScreenMpBloc({this.repository}) : super(SellerOrderNewCreditmemoScreenMpInitial()) {
    on<SellerOrderNewCreditMemoScreenMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerOrderNewCreditMemoScreenMpEvent event, Emitter<SellerOrderNewCreditmemoScreenMpState> emit) async {
    if (event is SellerOrderNewCreditmemoScreenMpFetchEvent) {
      emit(SellerOrderNewCreditmemoScreenMpInitial());
      try {
        var model = await repository?.getSellerOrderNewCReditMemoList(event.increementId!, event.invoiceId!);
        if (model != null) {
          emit(SellerOrderNewCreditmemoScreenMpSuccess(model));
        } else {
          emit(const SellerOrderNewCreditmemoScreenMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerOrderNewCreditmemoScreenMpError(error.toString()));
      }
    } else if(event is CreateCreditMemoEvent) {
      emit(SellerOrderNewCreditmemoScreenMpInitial());
      try {
        var model = await repository?.getSellerOrderCreateCreditMemo(event.increementId, event.comment, event.doOffline,event.sendEmail,
            event.invoiceId,event.shippingAmount, event.isVisibleOnFront,  event.adjustmentPositive, event.adjustmentNegative,
            event.commentCustomerNotify, event.productName, event.productId, event.currencyWithPrice);

        if (model != null) {
          emit(RefundOnlineMpSuccessState(model));
        } else {
          emit(const CreateCreditMemoScreenMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerOrderNewCreditmemoScreenMpError(error.toString()));
      }
    }

  }
}
