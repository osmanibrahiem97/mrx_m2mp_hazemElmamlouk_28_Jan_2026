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
import 'package:test_new/mobikul_mp/mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/network_manager/api_client.dart';
import '../../../mp_models/seller_download_shipment_mp_model/seller_download_shipment_mp_model.dart';

abstract class SellerInvoiceScreenRepository {
  Future<SellerInvoiceScreenMpModel> getSellerInvoiceView(String? increementId, String? invoiceId);
  Future<BaseModel> getSendinvoice(String? increementId, String? invoiceId);

}

class SellerInvoiceScreenRepositoryImp implements SellerInvoiceScreenRepository {
  @override
  Future<SellerInvoiceScreenMpModel> getSellerInvoiceView(String? increementId, String? invoiceId) async {

    SellerInvoiceScreenMpModel? responseData;
    try{
      responseData = await MPApiClient().getSellerInvoiceView(increementId, invoiceId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }

  @override
  Future<SellerDownloadShipmentMpModel> getDownloadAllInvoiceView(String? increementId, String? invoiceId) async {

    SellerDownloadShipmentMpModel? responseData;
    try{
      responseData = await MPApiClient().getSellerDownloadallInvoice(increementId, invoiceId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }

  @override
  Future<BaseModel> getSendinvoice(String? increementId, String? invoiceId) async {

    BaseModel? baseModel;
    try{
      baseModel = await MPApiClient().getSendInvoice(increementId, invoiceId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return baseModel!;
  }

/*@override
  Future<SellerInvoiceScreenMpModel> getSellerInvoiceView(String? increementId, String? invoiceId) async {
    try {
      final String response = await rootBundle
          .loadString('assets/responses/seller_view_invoice_response.json');
      Map<String, dynamic> userMap = jsonDecode(response);
      var responseData = SellerInvoiceScreenMpModel.fromJson(userMap);
      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }*/
}
