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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

import '../../../mp_network_manager/mp_api_client.dart';

abstract class SellerDashboardMpRepository {
  Future<SellerDashboardMpModel> getSellerDashboardMpData();
}

class SellerDashboardMpRepositoryImp implements SellerDashboardMpRepository {
  @override
  Future<SellerDashboardMpModel> getSellerDashboardMpData() async {
    SellerDashboardMpModel? responseData;
    try{
      responseData = await MPApiClient().getSellerDashboard();
    }
    catch(error,stacktrace){
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;

    // try {
    //   final String response = await rootBundle
    //       .loadString('assets/responses/seller_dashboard_response.json');
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   sellerDashboardMpModel =
    //       SellerDashboardMpModel.fromJson(jsonDecode(response.toString()));
    //
    //   if (kDebugMode) {
    //     print("Seller Dashboard Response ::: ");
    //     print(sellerDashboardMpModel.categoryChart!.length);
    //   }
    //   return sellerDashboardMpModel;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   throw Exception(e);
    // }
  }
}
