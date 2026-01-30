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
import 'package:test_new/mobikul/screens/view_invoice/bloc/view_invoice_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_repository.dart';

class CustomerMpBloc extends Bloc<CustomerMpEvent, CustomerMpState> {
  CustomerMpRepositoryImp? repository;

  CustomerMpBloc({this.repository}) : super(CustomerMpInitial()) {
    on<CustomerFetchEvent>(mapEventToState);
  }

  void mapEventToState(
      CustomerFetchEvent event, Emitter<CustomerMpState> emit) async {
    if (event is CustomerFetchEvent) {
      emit(CustomerMpInitial());
      try {
        var model = await repository?.getCustomerMpData(
          gender: event.gender,
          email: event.email,
          billingTelephone: event.billingTelephone,
          websiteId: event.websiteId,
          billingFull: event.billingFull,
          name: event.name,
        );
        if (model != null) {
          emit(CustomerMpSuccess(model));
        } else {
          emit(const CustomerMpError("Something Went Wrong!"));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(CustomerMpError(error.toString()));
      }
    }
  }
}
