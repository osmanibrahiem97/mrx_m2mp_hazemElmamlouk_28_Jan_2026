

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


import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/models/catalog/catalog_model.dart';
import '../../../../mobikul/models/catalog/request/catalog_product_request.dart';


abstract class CatalogMpRepository {
  Future<CatalogModel> getCatalogProducts(CatalogProductRequest request);
}

class CatalogMpRepositoryImpl extends CatalogMpRepository {
  @override
  Future<CatalogModel> getCatalogProducts(CatalogProductRequest request) async {


    CatalogModel? responseData;
    try{
      responseData = await MPApiClient().getSellerCollectionData(request.type??"", request.id??"", request.page??1, request.filterData??[], request.sortData);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
}
