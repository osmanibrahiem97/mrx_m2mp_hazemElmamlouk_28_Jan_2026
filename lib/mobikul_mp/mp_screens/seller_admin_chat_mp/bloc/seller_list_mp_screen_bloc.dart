
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

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_admin_chat_mp/bloc/seller_list_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_admin_chat_mp/bloc/seller_list_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_admin_chat_mp/bloc/seller_list_mp_screen_state.dart';

import '../../../../mobikul/models/base_model.dart';

class SellerListMpBloc extends Bloc<SellerListMpEvent, SellerListMpState> {
  SellerListMpRepositoryImp? repository;

  SellerListMpBloc({this.repository}) : super(SellerListMpInitial()) {
    on<SellerListMpEvent>(mapEventToState);
  }

  void mapEventToState(SellerListMpEvent event, Emitter<SellerListMpState> emit) async {
    if (event is SellerListMpFetchEvent) {
      emit(SellerListMpInitial());
      try {
        var model = await repository?.getSellerListData(event.query);
        if (model != null) {
          emit(SellerListMpSuccess(model));
        } else {
          emit(const SellerListMpError(''));
        }

      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerListMpError(error.toString()));

      }
    } else if (event is SellerAdminChatAdminNotifyEvent) {
      emit(SellerListMpInitial());
      try {
        BaseModel? model;
        if(event.isAdmin) {
          model = await repository?.getNotifyAdmin(
              event.sellerName, event.message);
        }else {
          model = await repository?.getNotifySeller(
              event.message, event.sellerName, event.sellerId);
        }
        if (model != null) {
          if(model.success == true) {
            emit(SellerAdminChatAdminNotifiState(model));
          } else {
            emit(const SellerListMpError(''));
          }
        } else {
          emit(const SellerListMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerListMpError(error.toString()));
      }
    }
  }
}