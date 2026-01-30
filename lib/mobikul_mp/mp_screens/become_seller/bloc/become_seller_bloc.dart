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
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_state.dart';

class BecomeSellerBloc extends Bloc<BecomeSellerEvent, BecomeSellerState> {
  BecomeSellerRepository? repository;

  BecomeSellerBloc({this.repository}) : super(BecomeSellerInitialState()) {
    on<BecomeSellerEvent>(mapEventToState);
  }

  void mapEventToState(
      BecomeSellerEvent event, Emitter<BecomeSellerState> emit) async {
    if (event is SubmitBecomeSellerEvent) {
      emit(BecomeSellerLoadingState());
      try {
        var model = await repository?.submitBecomeSeller(event.shopUrl);
        if (model != null) {
          if (model.success == true) {
            emit(SubmitBecomeSellerState(model));
          } else {
            emit(BecomeSellerErrorState(model.message.toString()));
          }
        } else {
          emit(const BecomeSellerErrorState(
              MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(BecomeSellerErrorState(error.toString()));
      }
    }
  }
}
