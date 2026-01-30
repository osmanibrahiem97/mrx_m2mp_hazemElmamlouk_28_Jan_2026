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
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_state.dart';

class TransactionMpBloc extends Bloc<TransactionMpEvent, TransactionMpState> {
  TransactionMpRepositoryImp? repository;

  TransactionMpBloc({this.repository}) : super(TransactionMpInitial()) {
    on<TransactionMpEvent>(mapEventToState);
  }

  void mapEventToState(
      TransactionMpEvent event, Emitter<TransactionMpState> emit) async {
    if (event is TransactionFetchEvent) {
      emit(TransactionMpInitial());
      try {
        var model = await repository?.getTransactionMpData(event.transactionId, event.dateFrom, event.dateTo, event.page);
        if (model != null) {
          emit(TransactionMpSuccess(model));
        } else {
          emit(const TransactionMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(TransactionMpError(error.toString()));
      }
    } else if (event is RequestWithdrawalEvent) {
      emit(TransactionMpInitial());
      try {
        var model = await repository?.requestWithdrawal();
        if (model != null) {
          emit(RequestWithdrawalState(model));
        } else {
          emit(const TransactionMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(TransactionMpError(error.toString()));
      }
    } else if (event is TransactionDownloadEvent) {
      emit(TransactionMpInitial());
      try {
        var model = await repository?.downloadTransactionList(event.dateTo, event.dateFrom, event.pageNumber, event.transactionId);
        if (model != null) {
          if (model.success??false)  {
            emit(TransactionDownloadSuccessState(model));
          } else {
            emit( TransactionMpError(model.message??""));
          }
        } else {
          emit(const TransactionMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(TransactionMpError(error.toString()));
      }
    }
  }
}
