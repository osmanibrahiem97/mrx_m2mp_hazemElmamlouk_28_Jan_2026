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

import 'package:flutter/services.dart';
import 'package:test_new/mobikul/models/order_details/order_detail_model.dart';

import '../../../../mobikul/models/invoice_view/download_invoice_model.dart';
import '../../../../mobikul/network_manager/api_client.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

// import '../../../../mobikul/models/invoice_view/download_invoice_model.dart';
// import '../../../../mobikul/network_manager/api_client.dart';
// import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

abstract class SellerOrderRefundScreenRepository {
  Future<CreditMemoListData> getInvoiceList(String page);
  Future<DownloadInvoiceModel> getDownloadUrl(String? incrementId, String? invoiceId);

}

class SellerOrderRefundScreenRepositoryImp implements SellerOrderRefundScreenRepository {
  @override
  Future<CreditMemoListData> getInvoiceList(String page) async {
    return CreditMemoListData();
  }

  @override
  Future<DownloadInvoiceModel> getDownloadUrl(String? incrementId, String? invoiceId) async {

    DownloadInvoiceModel? responseData;
    try{
      responseData = await ApiClient().getDownloadUrl(incrementId, invoiceId);
    }
    catch(error,stacktrace){
      print("Error --> $error");
      print("StackTrace --> $stacktrace");
    }
    return responseData!;
  }
}
