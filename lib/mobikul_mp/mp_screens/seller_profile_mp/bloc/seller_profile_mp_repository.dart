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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/models/account_info/account_info_model.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul/network_manager/api_client.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/upload_banner_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/widgets/seller_profile_save_request.dart';

import '../../../mp_network_manager/mp_api_client.dart';

abstract class SellerProfileMpRepository {
  Future<SellerProfileMpModel> getSellerProfileMpData();
  Future<BaseModel> sellerProfileSaveRequest(
      SellerProfileSaveRequestModel sellerProfileSaveRequestModel);
  Future<SellerProfileMpModel?> setImage(String image, String type);
  Future<BaseModel> deleteSellerImage(String entity);
}

class SellerProfileMpRepositoryImp implements SellerProfileMpRepository {
  /// ****getSellerProfileData**** ///
  @override
  Future<SellerProfileMpModel> getSellerProfileMpData() async {
    SellerProfileMpModel? responseData;
    try {
      responseData = await MPApiClient().getSellerProfileFormData();
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return responseData!;
  }

  @override
  Future<BaseModel> sellerProfileSaveRequest(
      SellerProfileSaveRequestModel sellerProfileSaveRequestModel) async {
    BaseModel? responseData;
    try {
      responseData = await MPApiClient().saveSellerProfileData(sellerProfileSaveRequestModel);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return responseData!;


    // try {
    //   final String response =
    //       await rootBundle.loadString('assets/responses/success.json');
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   baseModel = BaseModel.fromJson(userMap);
    //   return baseModel;
    // } catch (e, str) {
    //   if (kDebugMode) {
    //     print(e);
    //     print(str);
    //   }
    //   throw Exception(e);
    // }
  }

  @override
  Future<SellerProfileMpModel?> setImage(String image, String type) async {
    SellerProfileMpModel? model;
    try {
      if (type == AppConstant.profileImage) {
        model = await MPApiClient().uploadProfile(image);
      } else {
        model = await MPApiClient().uploadBannerPic(image);
      }
      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }

  @override
  Future<BaseModel> deleteSellerImage(String entity) async {
    try {
      BaseModel? model;
      model = await MPApiClient().deleteSellerImage(entity);

      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }
}
