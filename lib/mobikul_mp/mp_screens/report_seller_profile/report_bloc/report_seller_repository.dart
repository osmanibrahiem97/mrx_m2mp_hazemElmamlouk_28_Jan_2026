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

abstract class ReportSellerRepository {
  Future<BaseModel> submitReportSeller(
      {String? customerName,
      String? customerEmail,
      String? otherReason,
      bool? isOtherReason,
      int? sellerId,
      int? reasonId});
}

class ReportSellerRepositoryImp implements ReportSellerRepository {
  @override
  Future<BaseModel> submitReportSeller(
      {String? customerName,
      String? customerEmail,
      String? otherReason,
      bool? isOtherReason,
      int? sellerId,
      int? reasonId}) async {
    try {
      var model = await MPApiClient().submitSellerReportTempData(
          customerName: customerName,
          customerEmail: customerEmail,
          otherReason: otherReason,
          isOtherReason: isOtherReason,
          sellerId: sellerId,
          reasonId: reasonId);
      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }
}
