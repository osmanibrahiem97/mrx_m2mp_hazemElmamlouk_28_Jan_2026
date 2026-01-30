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
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

import '../../../mp_network_manager/mp_api_client.dart';

abstract class TransactionDetailMpRepository {
  Future<TransactionDetailMpModel> getTransactionDetailMpData(String transactionId);
}

class TransactionDetailMpRepositoryImp
    implements TransactionDetailMpRepository {
  @override
  Future<TransactionDetailMpModel> getTransactionDetailMpData(String transactionId) async {
    TransactionDetailMpModel? responseData;
    try{
      responseData = await MPApiClient().getTransactionDetails(transactionId);
    }
    catch(error,stacktrace){
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;

    // try {
    //   final String response = await rootBundle
    //       .loadString('assets/responses/seller_transaction_detail_reponse.json');
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   var responseData = TransactionDetailMpModel.fromJson(userMap);
    //
    //   if (kDebugMode) {
    //     print("####################");
    //     print(responseData.orderList![0]);
    //   }
    //   return responseData;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   throw Exception(e);
    // }
  }
}
