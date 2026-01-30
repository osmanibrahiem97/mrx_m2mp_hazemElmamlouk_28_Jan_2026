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

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

import '../../../mp_models/transaction_mp/transaction_download_mp_model.dart';
import '../../../mp_network_manager/mp_api_client.dart';

abstract class TransactionMpRepository {
  Future<TransactionMpModel> getTransactionMpData(String transactionId, String dateFrom, String dateTo, int pageNumber);
  Future<BaseModel> requestWithdrawal();
  Future<TransactionDownloadMpModel> downloadTransactionList(String? dateTo, String? dateFrom, int? pageNumber, String? transactionId);
}

class TransactionMpRepositoryImp implements TransactionMpRepository {
  @override
  Future<TransactionMpModel> getTransactionMpData(String transactionId, String dateFrom, String dateTo, int pageNumber) async {
    TransactionMpModel? responseData;
    try{
      responseData = await MPApiClient().getTransactionList(transactionId, dateFrom, dateTo, pageNumber);
    }
    catch(error,stacktrace){
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;

  }

  @override
  Future<BaseModel> requestWithdrawal() async {
    BaseModel? responseData;
    try{
      responseData = await MPApiClient().requestWithdrawal();
    }
    catch(error,stacktrace){
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;
  }

  @override
  Future<TransactionDownloadMpModel> downloadTransactionList(String? dateTo, String? dateFrom, int? pageNumber, String? transactionId) async {
    TransactionDownloadMpModel? responseData;
    try{
      responseData = await MPApiClient().downloadTransactionList(dateTo : dateTo, dateFrom: dateFrom, pageNumber: pageNumber, transactionId: transactionId);
    }
    catch(error,stacktrace){
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;
  }
}
