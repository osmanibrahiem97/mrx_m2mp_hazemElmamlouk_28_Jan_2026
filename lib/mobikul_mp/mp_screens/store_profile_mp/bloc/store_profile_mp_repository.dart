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
import 'package:test_new/mobikul/models/homePage/add_to_wishlist_response.dart';
import 'package:test_new/mobikul/network_manager/api_client.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';

import '../../../mp_network_manager/mp_api_client.dart';

abstract class StoreProfileMpRepository {
  Future<StoreProfileMpModel> getStoreProfileMpData(
      {int? sellerId, String? currency, int? width});
  Future<AddToWishlistResponse?> addToWishList(String productId);
  Future<BaseModel?> removeFromWishList(String productId);
  // Future<BaseModel?> submitSellerReport(
  //     {name, email, reasonId, isOtherReason, sellerId, reason});
}

class StoreProfileMpRepositoryImp implements StoreProfileMpRepository {
  /// ****getStoreProfileData**/
  @override
  Future<StoreProfileMpModel> getStoreProfileMpData(
      {int? sellerId, String? currency, int? width}) async {
    StoreProfileMpModel? storeProfileMpModel;
    try {
      storeProfileMpModel = await MPApiClient()
          .getStoreProfile(width: 1000, sellerId: sellerId, currency: currency);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return storeProfileMpModel!;
    // try {
    //   final String response = await rootBundle
    //       .loadString('assets/responses/store_profile_response.json');
    //   if (kDebugMode) {
    //     print('This is seller id :::::: $storeId');
    //   }
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   storeProfileMpModel = StoreProfileMpModel.fromJson(userMap);
    //   return storeProfileMpModel;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   throw Exception(e);
    // }
  }

  /// ***** SubmitSellerReport ***** ///
  // @override
  // Future<BaseModel> submitSellerReport(
  //     {name, email, reasonId, isOtherReason, sellerId, reason}) async {
  //   BaseModel? responseData;
  //   try {
  //     responseData = await MPApiClient().submitSellerReportTempData(
  //       name: name,
  //       email: email,
  //       reasonId: reasonId,
  //       isOtherReason: isOtherReason,
  //       sellerId: sellerId,
  //       reason: reason,
  //     );
  //   } catch (error, stacktrace) {
  //     print("Error --> " + error.toString());
  //     print("StackTrace --> " + stacktrace.toString());
  //   }
  //   return responseData!;
  // }

  /// ****AddToWishList**/
  @override
  Future<AddToWishlistResponse?> addToWishList(String productId) async {
    var wishlistAllAllCartData = await ApiClient().addToWishlist(productId);
    return wishlistAllAllCartData!;
  }

  /// ****RemoveFromWishList**/
  @override
  Future<BaseModel?> removeFromWishList(String productId) async {
    var responseData = await ApiClient().removeFromWishlist(productId);
    return responseData!;
  }
}
