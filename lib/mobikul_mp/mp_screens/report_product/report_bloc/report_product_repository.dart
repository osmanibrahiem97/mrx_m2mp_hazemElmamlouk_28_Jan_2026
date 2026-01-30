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

import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class ReportProductRepository {
  Future<BaseModel> submitReportProduct(
      {String? customerName,
      String? customerEmail,
      String? otherReason,
      bool? isOtherReason,
      int? productId,
      int? reasonId});
}

class ReportProductRepositoryImp implements ReportProductRepository {
  @override
  Future<BaseModel> submitReportProduct(
      {String? customerName,
      String? customerEmail,
      String? otherReason,
      bool? isOtherReason,
      int? productId,
      int? reasonId}) async {
    try {
      var model = await MPApiClient().reportProduct(
          customerName: customerName,
          customerEmail: customerEmail,
          otherReason: otherReason,
          isOtherReason: isOtherReason,
          productId: productId,
          reasonId: reasonId);
      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }
}
