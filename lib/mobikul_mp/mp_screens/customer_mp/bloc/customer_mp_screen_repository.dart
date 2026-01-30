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
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class CustomerMpRepository {
  Future<CustomerMpModel> getCustomerMpData();
}

class CustomerMpRepositoryImp implements CustomerMpRepository {
  @override
  Future<CustomerMpModel> getCustomerMpData(
      {String? name,
      String? email,
      String? billingFull,
      String? billingTelephone,
      String? gender,
      int? websiteId}) async {
    CustomerMpModel? customerMpModel;
    try {
      customerMpModel = await MPApiClient().getCustomerList(
        websiteId: websiteId,
        billingTelephone: billingTelephone,
        billingFull: billingFull,
        email: email,
        name: name,
        gender: gender,
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return customerMpModel!;

    // try {
    //   final String response = await rootBundle
    //       .loadString('assets/responses/cart_details_response.json');
    //   Map<String, dynamic> userMap = jsonDecode(response);
    //   var customerMpItemModel = CustomerMpItemModel.fromJson(userMap);
    //   return customerMpItemModel;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   throw Exception(e);
    // }
  }
}
