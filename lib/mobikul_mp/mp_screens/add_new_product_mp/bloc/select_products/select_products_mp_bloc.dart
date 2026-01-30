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
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_state.dart';

class SelectProductsMpBloc
    extends Bloc<SelectProductsMpEvent, SelectProductsMpState> {
  SelectProductsMpRepositoryImp? repository;

  SelectProductsMpBloc({this.repository}) : super(SelectProductsMpInitial()) {
    on<SelectProductsMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SelectProductsMpEvent event, Emitter<SelectProductsMpState> emit) async {
    if (event is SelectProductsMpFetchEvent) {
      emit(SelectProductsMpInitial());
      try {
        var model = await repository?.getSelectProductsMpData(
          pageType: event.pageType,
          width: event.width,
          pageNumber: event.pageNumber,
          filterData: event.filterData,
          sortData: event.sortData,
          onlySelected: event.onlySelected,
          productId: event.productId,
        );

        if (model != null) {
          emit(SelectProductsMpSuccess(model, event.pageType));
        } else {
          emit(const SelectProductsMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SelectProductsMpError(error.toString()));
      }
    }
  }
}
