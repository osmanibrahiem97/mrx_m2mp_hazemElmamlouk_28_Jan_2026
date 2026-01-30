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

import 'package:flutter/foundation.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import '../../../mp_models/invoice_print_template_mp/invoice_mp_model.dart';
import '../../../mp_network_manager/mp_api_client.dart';

abstract class InvoicePrintTemplateMpRepository {
  Future<InvoiceMpModel> getInvoicePrintTemplateMpData();
  Future<BaseModel> savePrintTemplateMpData(String pdfHeader);
}

class InvoicePrintTemplateMpRepositoryImp
    implements InvoicePrintTemplateMpRepository {
  @override
  Future<InvoiceMpModel> getInvoicePrintTemplateMpData() async {
    InvoiceMpModel? responseData;
    try {
      responseData = await MPApiClient().getInvoicePrintTempData();
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return responseData!;
  }

  @override
  Future<BaseModel> savePrintTemplateMpData(String pdfHeader) async {
    BaseModel? responseData;
    try {
      responseData = await MPApiClient().saveInvoicePrintTempData(pdfHeader);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
    return responseData!;
  }
}
