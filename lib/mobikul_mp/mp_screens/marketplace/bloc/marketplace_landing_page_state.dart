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

import 'package:equatable/equatable.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/marketplace_layout_one_model.dart';

abstract class MarketplaceLandingPageState extends Equatable {
  const MarketplaceLandingPageState();

  @override
  List<Object> get props => [];
}

class MarketplaceLandingPageInitial extends MarketplaceLandingPageState {}

class MarketplaceLandingPageSuccess extends MarketplaceLandingPageState {
  final MarketplaceLandingPageModel marketplaceLandingPageModel;
  const MarketplaceLandingPageSuccess(this.marketplaceLandingPageModel);
}

class MarketplaceLandingPageError extends MarketplaceLandingPageState {
  final String message;
  const MarketplaceLandingPageError(this.message);
}
