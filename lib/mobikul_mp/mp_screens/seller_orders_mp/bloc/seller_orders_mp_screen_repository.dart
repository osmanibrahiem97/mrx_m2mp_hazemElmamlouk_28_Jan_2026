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
import 'package:test_new/mobikul_mp/mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/network_manager/api_client.dart';

abstract class SellerOrdersMpRepository {
  Future<SellerOrderListMpModel> getSellerOrdersMpData(int? page, String? orderId, String? dateFrom, String? dateTo, String? status);
}

class SellerOrdersMpRepositoryImp implements SellerOrdersMpRepository {
  @override
  Future<SellerOrderListMpModel> getSellerOrdersMpData(int? page, String? orderId, String? dateFrom, String? dateTo, String? status) async {

    SellerOrderListMpModel? responseData;
    try{
      responseData = await MPApiClient().getSellerOrderList(page, orderId, dateFrom, dateTo, status);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
}
