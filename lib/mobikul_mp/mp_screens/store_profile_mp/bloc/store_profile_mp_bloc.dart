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
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_state.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_event.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_repository.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_state.dart';

class StoreProfileMpBloc
    extends Bloc<StoreProfileMpEvent, StoreProfileMpState> {
  StoreProfileMpRepositoryImp? repository;

  StoreProfileMpBloc({this.repository}) : super(StoreProfileMpInitial()) {
    on<StoreProfileMpEvent>(mapEventToState);
  }

  void mapEventToState(
      StoreProfileMpEvent event, Emitter<StoreProfileMpState> emit) async {
    if (event is StoreProfileMpFetchEvent) {
      emit(StoreProfileMpInitial());
      try {
        var model = await repository?.getStoreProfileMpData(
            width: event.width,
            currency: event.currency,
            sellerId: event.sellerId);
        if (model != null) {
          emit(StoreProfileMpSuccess(model));
        } else {
          emit(const StoreProfileMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(StoreProfileMpError(error.toString()));
      }
    }
  }
  //  else if (event is AddToWishlistEvent) {
  //   try {
  //     var model = await repository?.addToWishList(event.productId ?? "");
  //     if (model != null) {
  //       emit(AddProductToWishlistStateSuccess(model, event.productId ?? ''));
  //     }
  //   } catch (error, _) {
  //     print(error.toString());
  //     emit(StoreProfileMpError(error.toString()));
  //   }
  // } else if (event is RemoveFromWishlistEvent) {
  //   try {
  //     var model = await repository?.removeFromWishList(event.productId ?? "");
  //     if (model != null) {
  //       emit(RemoveFromWishlistStateSuccess(model, event.productId ?? ''));
  //     }
  //   } catch (error, _) {
  //     print(error.toString());
  //     emit(StoreProfileMpError(error.toString()));
  //   }
  // }
}
