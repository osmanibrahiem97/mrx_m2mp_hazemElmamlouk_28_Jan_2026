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
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class AskQuestionMpRepository {
  Future<BaseModel> submitAskQuestion(String query, String subject);
}

class AskQuestionMpRepositoryImp implements AskQuestionMpRepository {
  @override
  Future<BaseModel> submitAskQuestion(String query, String subject) async {
    try {
      var model = await MPApiClient().submitAskQuestion(query, subject);
      return model!;
    } catch (e, str) {
      if (kDebugMode) {
        print(e);
        print(str);
      }
      throw Exception(e);
    }
  }
}
