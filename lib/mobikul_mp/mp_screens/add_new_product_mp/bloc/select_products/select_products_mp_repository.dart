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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class SelectProductsMpRepository {
  Future<SelectProductsMpModel> getSelectProductsMpData(
      {String? pageType,
      int? width,
      int? pageNumber,
      String? filterData,
      String? sortData,
      int? onlySelected,
      int? productId});
}

class SelectProductsMpRepositoryImp implements SelectProductsMpRepository {
  @override
  Future<SelectProductsMpModel> getSelectProductsMpData(
      {String? pageType,
      int? width,
      int? pageNumber,
      String? filterData,
      String? sortData,
      int? onlySelected,
      int? productId}) async {
    SelectProductsMpModel? selectProductsMpModel;

    try {
      print("TEST_LOG====> $pageType");
      selectProductsMpModel = pageType == "Related"
          ? await MPApiClient().getSellerRelatedProductData(
              width: width,
              pageNumber: pageNumber,
              filterData: filterData,
              sortData: sortData,
              onlySelected: onlySelected,
              productId: productId,
            )
          : pageType == "UpSell"
              ? await MPApiClient().getSellerUpSellProductData(
                  productId: productId.toString(),
                )
              : pageType == "CrossSell"
                  ? await MPApiClient().getSellerCrossSellProductData(
                      productId: productId,
                    )
                  : await MPApiClient().getSellerRelatedProductData(
                      width: width,
                      pageNumber: pageNumber,
                      filterData: filterData,
                      sortData: sortData,
                      onlySelected: onlySelected,
                      productId: productId,
                    );

      return selectProductsMpModel!;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }
}
