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
import 'package:test_new/mobikul/network_manager/api_client.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../../../mp_models/ship_items_createshipment_model/ship_items_createshipment_mp_model.dart';

abstract class SellerOrderDetailMpRepository {
  Future<SellerOrderDetailsMpModel> getSellerOrderMpDetails(String orderId, String sellerId);
  Future<BaseModel> getSellerOrderCreateInvoice(String increementId);
  Future<ShipItemsCreateshipmentMpModel> getSellerCreateShipment(String increementId,String carrierData, String trackingData);
  Future<BaseModel> getSendOrderEmail(String? orderId);
  Future<BaseModel> reorder(String incrementId);
}


class SellerOrderDetailMpRepositoryImp implements SellerOrderDetailMpRepository {
  @override
  Future<SellerOrderDetailsMpModel> getSellerOrderMpDetails(String? orderId, String? sellerId) async {

    SellerOrderDetailsMpModel? sellerOrderDetailsMpModel;
    try{
      sellerOrderDetailsMpModel = await MPApiClient().getSellerOrderDetails(orderId, sellerId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return sellerOrderDetailsMpModel!;
  }

  @override
  Future<BaseModel> getSellerOrderCreateInvoice(String? orderId) async {
    BaseModel? baseModel;
    try{
      baseModel = await MPApiClient().getSellerCreateInvoice(orderId);
    } catch (error,stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return baseModel!;
  }


  @override
  Future<BaseModel> getSellerCancelOrder(String? orderId) async {
    BaseModel? baseModel;
    try{
      baseModel = await MPApiClient().getSellerCancelOrder(orderId);
    } catch (error,stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return baseModel!;
  }

  @override
  Future<ShipItemsCreateshipmentMpModel> getSellerCreateShipment(String? orderId, String? carrierData,
      String? trackingData) async {
    ShipItemsCreateshipmentMpModel? shipItemsCreateshipmentMpModel;
    try{
      shipItemsCreateshipmentMpModel = await MPApiClient().getSellerCreateShipment(orderId, carrierData, trackingData);
    } catch (error,stacktrace) {
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return shipItemsCreateshipmentMpModel!;
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


  @override
  Future<BaseModel> reorder(String? incrementId) async {
    var responseData = await ApiClient().reorder(incrementId!);
    return responseData!;
  }
}
