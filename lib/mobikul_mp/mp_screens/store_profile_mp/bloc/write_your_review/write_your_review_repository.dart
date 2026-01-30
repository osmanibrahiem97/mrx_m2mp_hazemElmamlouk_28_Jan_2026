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

abstract class WriteYourReviewRepository {
  Future<BaseModel> submitWriteYourReview(
    String shopUrl,
    String nickName,
    String summary,
    String sellerId,
    double priceRating,
    double valueRating,
    String description,
    String customerEmail,
    double qualityRating,
  );
}

class WriteYourReviewRepositoryImp implements WriteYourReviewRepository {
  @override
  Future<BaseModel> submitWriteYourReview(
    String shopUrl,
    String nickName,
    String summary,
    String sellerId,
    double priceRating,
    double valueRating,
    String description,
    String customerEmail,
    double qualityRating,
  ) async {
    try {
      var model = await MPApiClient().submitWriteYourReview(
          shopUrl,
          nickName,
          summary,
          sellerId,
          priceRating,
          valueRating,
          description,
          customerEmail,
          qualityRating);
      return model!;
    } catch (e, str) {
      print(e);
      print(str);
      throw Exception(e);
    }
  }
}
