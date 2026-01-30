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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/all_sellers/all_sellers_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class AllSellersRepository {
  Future<AllSellersModel> getAllSellersData(String searchQuery);
}

class AllSellersRepositoryImp implements AllSellersRepository {
  @override
  Future<AllSellersModel> getAllSellersData(String searchQuery) async {
    AllSellersModel? responseData;
    try {
      responseData = await MPApiClient().getAllSellersListTempData(searchQuery);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
    return responseData!;
  }
}
