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
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/models/base_model.dart';
import '../../../../mobikul/network_manager/api_client.dart';
import '../../../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';

abstract class SellerOrderViewRefundScreenRepository {
  Future<SellerOrdersViewRefundMpModel> getSellerOrderViewRefundList(String? increementId,String? creditMemoId);
  Future<BaseModel> getSellerSentEmail(String? increementId,String? creditMemoId);
}

class SellerOrderViewRefundScreenRepositoryImp implements SellerOrderViewRefundScreenRepository {

  @override
  Future<SellerOrdersViewRefundMpModel> getSellerOrderViewRefundList(String? increementId,String? creditMemoId) async {
    SellerOrdersViewRefundMpModel? responseData;
    try {
      responseData = await MPApiClient().getSellerRefund(increementId, creditMemoId);
    }
    catch (error, stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }

  @override
  Future<BaseModel> getSellerSentEmail(String? increementId,String? creditMemoId) async {
    BaseModel? baseModel;
    try {
      baseModel = await MPApiClient().getSendcreditmemo(increementId, creditMemoId);
    }
    catch (error, stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return baseModel!;
  }
}
