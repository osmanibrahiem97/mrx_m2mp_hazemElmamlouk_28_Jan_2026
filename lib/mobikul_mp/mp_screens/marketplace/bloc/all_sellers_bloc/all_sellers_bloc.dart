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
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_sellers_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_sellers_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_selllers_event.dart';

class AllSellersBloc extends Bloc<AllSellersEvent, AllSellersState> {
  AllSellersRepositoryImp? repository;

  AllSellersBloc({this.repository}) : super(AllSellersInitial()) {
    on<AllSellersEvent>(mapEventToState);
  }

  void mapEventToState(
      AllSellersEvent event, Emitter<AllSellersState> emit) async {
    if (event is AllSellersFetchEvent) {
      emit(AllSellersInitial());
      try {
        var model = await repository?.getAllSellersData(event.searchQuery);
        if (model != null) {
          if (model.success == true) {
            emit(AllSellersSuccess(model));
          } else {
            emit(AllSellersError(model.message.toString()));
          }
        } else {
          emit(const AllSellersError('Something went wrong!'));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AllSellersError(error.toString()));
      }
    }
  }
}
