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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_image_upload/product_image_upload_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/save_product_mp_model/save_product_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/seller_new_product_save_request.dart';

import '../../../mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';
import '../../../mp_models/add_new_product_mp_model/upload_file_data_model/upload_file_data_model.dart';

abstract class AddNewProductMpRepository {
  Future<AddNewProductMpModel> getAddNewProductMpData(int productId);
  Future<ProductImageUploadModel> uploadProductMp();
  Future<BaseModel> sellerNewProductSaveRequest(
      SellerNewProductSaveRequestModel sellerNewProductSaveRequestModel,
      int? productId);
  Future<SelectProductsMpModel> getSelectProductsMpData(
      {String? pageType,
      int? width,
      int? pageNumber,
      String? filterData,
      String? sortData,
      int? onlySelected,
      int? productId});

  Future<UploadDownloadableProductFileModel> uploadDownlodableProductFile(String? fileName, String? fileEncoded, String? fileType );

}

class AddNewProductMpRepositoryImp implements AddNewProductMpRepository {
  @override
  Future<AddNewProductMpModel> getAddNewProductMpData(int productId) async {
    AddNewProductMpModel? responseData;
    try {
      responseData = await MPApiClient().getAddNewProductData(productId);
    } catch (error, stacktrace) {
      print("Error --> " + error.toString());
      print("StackTrace --> " + stacktrace.toString());
    }
    return responseData!;
  }

  Future<ProductImageUploadModel> uploadProductMp(
      {String? imageEncoded, String? imageName}) async {
    ProductImageUploadModel? productImageUploadModel;
    try {
      productImageUploadModel = await MPApiClient()
          .uploadProductImage(imageEncoded: imageEncoded, imageName: imageName);
      return productImageUploadModel!;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }

  Future<SaveProductModel> sellerNewProductSaveRequest(
      SellerNewProductSaveRequestModel sellerNewProductSaveRequestModel,
      int? productId) async {
    print("TEST LOG ::: baseImage => ${sellerNewProductSaveRequestModel?.baseImage}");
    SaveProductModel? saveProductModel;
    try {
      saveProductModel = await MPApiClient().saveSellerProduct(
          sellerNewProductSaveRequestModel: sellerNewProductSaveRequestModel,
          productId: productId);
      return saveProductModel!;
    } catch (e, str) {
      if (kDebugMode) {
        print(e);
        print(str);
      }
      throw Exception(e);
    }
  }

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

  @override
  Future<UploadDownloadableProductFileModel> uploadDownlodableProductFile(String? fileName, String? fileEncoded, String? fileType ) async {
    UploadDownloadableProductFileModel? uploadDownloadableProductFileModel;
    try {
      uploadDownloadableProductFileModel =
      await MPApiClient().uploadDownloadableProductFile(
          fileName, fileEncoded, fileType);
      return uploadDownloadableProductFileModel!;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }
}
