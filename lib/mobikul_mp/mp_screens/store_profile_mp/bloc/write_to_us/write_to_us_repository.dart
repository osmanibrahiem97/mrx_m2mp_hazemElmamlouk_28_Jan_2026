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

abstract class WriteToUsRepository {
  Future<BaseModel> submitWriteToUs(String query, String subject, int sellerId);
}

class WriteToUsRepositoryImp implements WriteToUsRepository {
  @override
  Future<BaseModel> submitWriteToUs(
      String query, String subject, int sellerId) async {
    try {
      var model = await MPApiClient().submitWriteToUs(query, subject, sellerId);
      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }
}
