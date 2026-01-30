
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
import 'package:test_new/mobikul_mp/mp_models/seller_download_shipment_mp_model/seller_download_shipment_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/models/base_model.dart';
import '../../../../mobikul/network_manager/api_client.dart';
import '../../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';

abstract class SellerOrderShipmentScreenRepository {
  Future<BaseModel> getSendtrackInformationData(String? increementId,String?  shipmentId);
  Future<SellerOrdersShipmentMpModel> getSellerOrderShipmentList(String increementId, String? shipmentId);
  Future<BaseModel> getSendOrderEmail(String? orderId);

}

class SellerOrderShipmentScreenRepositoryImp implements SellerOrderShipmentScreenRepository {
  @override
  Future<SellerOrdersShipmentMpModel> getSellerOrderShipmentList(String? increementId,String? shipmentId) async {
    SellerOrdersShipmentMpModel? responseData;
    try {
      responseData =
      await MPApiClient().getSellerShipmentView(increementId, shipmentId);
    }
    catch (error, stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
  /*@override
  Future<SellerOrdersShipmentMpModel> getSellerOrderShipmentList(String? increementId, String? shipmentId) async {
    try {
      final String response = await rootBundle
          .loadString('assets/responses/seller_view_shipment_response.json');
      Map<String, dynamic> userMap = jsonDecode(response);
      var responseData = SellerOrdersShipmentMpModel.fromJson(userMap);
      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }*/
  @override
  Future<BaseModel> getSendtrackInformationData(String? increementId,String?  shipmentId) async {
    BaseModel? responseData;
    try{
      responseData = await MPApiClient().getSellerSendTrackingInfo(increementId, shipmentId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }

    return responseData!;
  }

  @override
  Future<SellerDownloadShipmentMpModel> getDownloadAllShipmentView(String? dateTo,String?  dateFrom, String? shipmentId, String? increementId) async {
    SellerDownloadShipmentMpModel? responseData;
    try{
      responseData = await MPApiClient().getDownloadAllShipmentView(dateTo, dateFrom, shipmentId, increementId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }

    return responseData!;
  }

  @override
  Future<BaseModel> getSendOrderEmail(String? orderId) async {
    BaseModel? baseModel;
    try{
      baseModel = await MPApiClient().getSendOrderEmail(orderId);
    } catch (error,stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return baseModel!;
  }
}
