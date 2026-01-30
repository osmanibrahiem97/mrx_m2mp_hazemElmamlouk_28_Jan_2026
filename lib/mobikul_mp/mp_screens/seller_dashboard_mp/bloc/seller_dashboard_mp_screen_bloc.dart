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

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_state.dart';

class SellerDashboardMpBloc
    extends Bloc<SellerDashboardMpEvent, SellerDashboardMpState> {
  SellerDashboardMpRepositoryImp? repository;

  SellerDashboardMpBloc({this.repository}) : super(SellerDashboardMpInitial()) {
    on<SellerDashboardMpFetchEvent>(mapEventToState);
  }

  void mapEventToState(SellerDashboardMpFetchEvent event,
      Emitter<SellerDashboardMpState> emit) async {
    if (event is SellerDashboardMpFetchEvent) {
      emit(SellerDashboardMpInitial());
      try {
        var model = await repository?.getSellerDashboardMpData();
        if (model != null) {
          emit(SellerDashboardMpSuccess(model));
        } else {
          emit(const SellerDashboardMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerDashboardMpError(error.toString()));
      }
    }
  }
}
