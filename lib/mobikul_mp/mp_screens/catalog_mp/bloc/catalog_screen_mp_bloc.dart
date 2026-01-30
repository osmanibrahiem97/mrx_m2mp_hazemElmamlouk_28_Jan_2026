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
import 'catalog_screen_mp_event.dart';
import 'catalog_screen_mp_repository.dart';
import 'catalog_screen_mp_state.dart';

class CatalogScreenMpBloc extends Bloc<CatalogScreenMpEvent, CatalogScreenMpState> {
  CatalogMpRepository? repository;

  CatalogScreenMpBloc({this.repository}) : super(CatalogInitialState()) {
    on<CatalogScreenMpEvent>(mapEventToState);
  }

  void mapEventToState(
      CatalogScreenMpEvent event, Emitter<CatalogScreenMpState> emit) async {
    if (event is FetchCatalogEvent) {
      emit(CatalogInitialState());
      var model = await repository?.getCatalogProducts(event.request);
      try {
        if (model != null) {
          emit(CatalogFetchState(model));
        } else {
          emit(CatalogErrorState(''));
        }
      } catch (error, _) {
        emit(CatalogErrorState(error.toString()));
      }
    }  else if (event is LoadingEvent) {
      emit(CatalogInitialState());
    } else if (event is ChangeViewEvent) {
      emit(ChangeViewState(event.isGrid));
    }
  }
}
