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

abstract class BecomeSellerState {
  const BecomeSellerState();

  @override
  List<Object?> get props => [];
}

class BecomeSellerInitialState extends BecomeSellerState {}

class BecomeSellerLoadingState extends BecomeSellerState {}

class BecomeSellerSuccessState extends BecomeSellerState {}

class BecomeSellerErrorState extends BecomeSellerState {
  final String message;
  const BecomeSellerErrorState(this.message);
}

class SubmitBecomeSellerState extends BecomeSellerState {
  final BaseModel data;
  const SubmitBecomeSellerState(this.data);
}

class SubmitBecomeSellerEmptyState extends BecomeSellerState {}
