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
import 'package:test_new/mobikul/screens/view_invoice/bloc/view_invoice_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_state.dart';

class TransactionDetailMpBloc
    extends Bloc<TransactionDetailMpEvent, TransactionDetailMpState> {
  TransactionDetailMpRepositoryImp? repository;

  TransactionDetailMpBloc({this.repository})
      : super(TransactionDetailMpInitial()) {
    on<TransactionDetailMpEvent>(mapEventToState);
  }

  void mapEventToState(TransactionDetailMpEvent event,
      Emitter<TransactionDetailMpState> emit) async {
    if (event is TransactionDetailMpFetchEvent) {
      emit(TransactionDetailMpInitial());
      try {
        var model = await repository?.getTransactionDetailMpData(event.transactionId);
        if (model != null) {
          emit(TransactionDetailMpSuccess(model));
        } else {
          emit(const TransactionDetailMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(TransactionDetailMpError(error.toString()));
      }
    }
  }
}
