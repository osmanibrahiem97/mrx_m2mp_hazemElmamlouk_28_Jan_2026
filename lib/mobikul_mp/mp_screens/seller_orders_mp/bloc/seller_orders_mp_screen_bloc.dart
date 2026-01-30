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
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_state.dart';

class SellerOrdersMpBloc
    extends Bloc<SellerOrdersMpEvent, SellerOrdersMpState> {
  SellerOrdersMpRepositoryImp? repository;

  SellerOrdersMpBloc({this.repository}) : super(SellerOrdersMpInitial()) {
    on<SellerOrdersMpEvent>(mapEventToState);
  }

  void mapEventToState(SellerOrdersMpEvent event,
      Emitter<SellerOrdersMpState> emit) async {
    if (event is SellerOrdersScreenDataFetchEvent) {
      emit(SellerOrdersMpInitial());
      try {
        var model = await repository?.getSellerOrdersMpData(event.page, event.orderId, event.dateFrom, event.dateTo, event.status);
        //int? page, String orderId, String dateFrom, String dateTo, String status

        if (model != null) {
          emit(SellerOrdersMpSuccess(model));
        } else {
          emit(const SellerOrdersMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerOrdersMpError(error.toString()));
      }
    }
  }
}
