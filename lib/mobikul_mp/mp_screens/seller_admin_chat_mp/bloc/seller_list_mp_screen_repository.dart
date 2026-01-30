
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

import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_list_mp/seller_list_mp_model.dart';
import '../../../mp_network_manager/mp_api_client.dart';

abstract class SellerListMpRepository {
  Future<SellerListMpModel> getSellerListData(String query);
  Future<BaseModel> getNotifyAdmin(String message, String sellerName);
  Future<BaseModel?> getNotifySeller(String message, String adminName, int sellerId);

}

class SellerListMpRepositoryImp implements SellerListMpRepository {
  @override
  Future<SellerListMpModel> getSellerListData(String query) async {

    SellerListMpModel? responseData;
    try {
      responseData = await MPApiClient().getSellerListForChat(query);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
    return responseData!;

    // try{
    //   final String response = await rootBundle
    //       .loadString('assets/responses/seller_list_data_response.json');
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   var sellerListModel = SellerListMpModel.fromJson(userMap);
    //   return sellerListModel;
    //
    // }
    // catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   throw Exception(e);
    // }
  }

  @override
  Future<BaseModel> getNotifyAdmin(String message, String sellerName) async {
    BaseModel? baseModel;
    try {
      baseModel = await MPApiClient().notifyAdmin(message, sellerName);
    }
    catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
    return baseModel!;
  }

  @override
  Future<BaseModel?> getNotifySeller(String message, String adminName, int sellerId) async {
   BaseModel? baseModel;
   try {
     baseModel = await MPApiClient().notifySeller(adminName, message, sellerId);
    }
   catch (e) {
     if (kDebugMode) {
       print(e);
     }
     throw Exception(e);
   }
   return baseModel;
 }
}
