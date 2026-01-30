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
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_network_manager/mp_api_client.dart';

abstract class MarketplaceLandingPageRepository {
  Future<MarketplaceLandingPageModel?> getMarketplaceLandingPageData();
}

class MarketplaceLandingPageRepositoryImp
    implements MarketplaceLandingPageRepository {
  @override
  Future<MarketplaceLandingPageModel?> getMarketplaceLandingPageData() async {
    MarketplaceLandingPageModel? marketplaceLandingPageModel;
    try {
      marketplaceLandingPageModel = await MPApiClient().getMarketplaceData();
      print("TEST LOG ::: MarketplaceLandingModel => $marketplaceLandingPageModel");
      return marketplaceLandingPageModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Error --> $error");
        print("StackTrace --> $stacktrace");
      }
    }
  }
}

