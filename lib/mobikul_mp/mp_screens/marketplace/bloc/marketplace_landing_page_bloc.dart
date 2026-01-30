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
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_state.dart';

class MarketplaceLandingPageBloc
    extends Bloc<MarketplaceLandingPageEvent, MarketplaceLandingPageState> {
  MarketplaceLandingPageRepositoryImp? repository;

  MarketplaceLandingPageBloc({this.repository})
      : super(MarketplaceLandingPageInitial()) {
    on<MarketplaceLandingPageEvent>(mapEventToState);
  }

  void mapEventToState(MarketplaceLandingPageEvent event,
      Emitter<MarketplaceLandingPageState> emit) async {
    if (event is MarketplaceLandingPageFetchEvent) {
      emit(MarketplaceLandingPageInitial());
      try {
        var model = await repository?.getMarketplaceLandingPageData();
        if (model != null) {
          emit(MarketplaceLandingPageSuccess(model));
        } else {
          emit(const MarketplaceLandingPageError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(MarketplaceLandingPageError(error.toString()));
      }
    }
  }
}
