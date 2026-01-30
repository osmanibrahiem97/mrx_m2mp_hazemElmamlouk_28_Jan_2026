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
import 'package:test_new/mobikul_mp/mp_screens/seller_products_mp/bloc/seller_products_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_products_mp/bloc/seller_products_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_products_mp/bloc/seller_products_mp_screen_state.dart';

class SellerProductsMpBloc
    extends Bloc<SellerProductsMpEvent, SellerProductsMpState> {
  SellerProductsMpRepositoryImp? repository;

  SellerProductsMpBloc({this.repository}) : super(SellerProductsMpInitial()) {
    on<SellerProductsMpEvent>(mapEventToState);
  }

  void mapEventToState(SellerProductsMpEvent event,
      Emitter<SellerProductsMpState> emit) async {
    if (event is SellerProductsMpFetchEvent) {
      emit(SellerProductsMpInitial());
      try {
        var model = await repository?.getSellerProductsMpData(event.page);
        if (model != null) {
          if (model.success??false) {
            emit(SellerProductsMpSuccess(model));
          } else {
            emit( SellerProductsMpError(model.message??""));
          }
        } else {
          emit(const SellerProductsMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProductsMpError(error.toString()));
      }
    } else if (event is SellerProductDeleteEvent) {
      emit(SellerProductsMpInitial());
      try {
        var model = await repository?.deleteSellerProduct(event.productId);
        if (model != null) {
          if (model.success??false) {
            emit(SellerDeleteProductSuccess(model, event.index));
          } else {
            emit( SellerProductsMpError(model.message??""));
          }
        } else {
          emit(const SellerProductsMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProductsMpError(error.toString()));
      }
    }
  }
}
