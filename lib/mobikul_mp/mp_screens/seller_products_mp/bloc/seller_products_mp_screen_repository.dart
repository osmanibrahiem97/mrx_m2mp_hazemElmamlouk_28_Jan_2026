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
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

import '../../../mp_models/seller_products_mp/seller_products_list_mp_model.dart';
import '../../../mp_network_manager/mp_api_client.dart';

abstract class SellerProductsMpRepository {
  Future<SellerProductsListMpModel> getSellerProductsMpData(int pageNumber);
  Future<BaseModel> deleteSellerProduct(String productId);
}

class SellerProductsMpRepositoryImp implements SellerProductsMpRepository {

  @override
  Future<SellerProductsListMpModel> getSellerProductsMpData(int pageNumber) async {
    SellerProductsListMpModel? responseData;
    try{
      responseData = await MPApiClient().getProductList(pageNumber);
    }
    catch(error,stacktrace){
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return responseData!;

  }

  @override
  Future<BaseModel> deleteSellerProduct(String productId) async {
    BaseModel? responseData;
    try{
      responseData = await MPApiClient().deleteSellerProduct(productId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;

  }
}
