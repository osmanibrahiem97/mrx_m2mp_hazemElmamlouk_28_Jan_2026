
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

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_new/mobikul_mp/mp_models/creditmemo_mp/create_creditmemorequest_model.dart';
import 'package:test_new/mobikul_mp/mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/models/base_model.dart';
import '../../../../mobikul/network_manager/api_client.dart';
import '../../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';

abstract class SellerOrderNewCreditmemoScreenRepository {
  Future<SellerOrdersCreditmemoMpModel> getSellerOrderNewCReditMemoList(String? increementId, String? invoiceId);
  Future<SellerOrdersCreditmemoMpModel> getSellerOrderCreateCreditMemo(String? increementId, String? comment,
      String? doOffline, String? sendEmail, String? invoiceId,
      String? shippingAmount, String? isVisibleOnFront, String? adjustmentPositive, String? adjustmentNegative,  String? commentCustomerNotify,
      String? productName,  int? productId, String?  currencyWithPrice);
}

class SellerOrderNewCreditmemoScreenRepositoryImp implements SellerOrderNewCreditmemoScreenRepository {

  @override
  Future<SellerOrdersCreditmemoMpModel> getSellerOrderNewCReditMemoList(String? increementId, String? invoiceId) async {
    SellerOrdersCreditmemoMpModel? responseData;
    try {
      responseData =
      await MPApiClient().getSellerCreditMemoFormData(increementId, invoiceId);
    }
    catch (error, stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
/*
  @override
  Future<SellerOrdersCreditmemoMpModel> getSellerOrderNewCReditMemoList(String? increementId) async {
    SellerOrdersCreditmemoMpModel? responseData;
    try {
      final String response = await rootBundle
          .loadString('assets/responses/seller_order_credit_memo_formdata.json');
      Map<String, dynamic> userMap = jsonDecode(response);
      var responseData = SellerOrdersCreditmemoMpModel.fromJson(userMap);
      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }*/
  @override
  Future<SellerOrdersCreditmemoMpModel> getSellerOrderCreateCreditMemo(String? increementId, String? comment,
      String? doOffline, String? sendEmail, String? invoiceId,
      String? shippingAmount, String? isVisibleOnFront, String? adjustmentPositive, String? adjustmentNegative,
      String? commentCustomerNotify, String? productName,  int? productId, String? currencyWithPrice) async {


    SellerOrdersCreditmemoMpModel? responseData;
    try {
      responseData =
      await MPApiClient().getSellerCreateCreditMemo(increementId, comment, doOffline,sendEmail,invoiceId, shippingAmount, isVisibleOnFront,
          adjustmentPositive, adjustmentNegative, commentCustomerNotify, productName,productId, currencyWithPrice);
    }

    catch (error, stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
}
