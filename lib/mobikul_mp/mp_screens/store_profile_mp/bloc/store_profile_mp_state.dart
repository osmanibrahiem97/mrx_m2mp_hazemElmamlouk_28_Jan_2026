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
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul/models/homePage/add_to_wishlist_response.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';

abstract class StoreProfileMpState extends Equatable {
  const StoreProfileMpState();

  @override
  List<Object> get props => [];
}

class StoreProfileMpInitial extends StoreProfileMpState {}

class StoreProfileMpSuccess extends StoreProfileMpState {
  final StoreProfileMpModel storeProfileMpModel;
  const StoreProfileMpSuccess(this.storeProfileMpModel);
}

class StoreProfileMpError extends StoreProfileMpState {
  final String message;
  const StoreProfileMpError(this.message);
}

class SubmitSellerReportState extends StoreProfileMpState {
  final BaseModel data;
  const SubmitSellerReportState(this.data);
}

class AddProductToWishlistStateSuccess extends StoreProfileMpState {
  final AddToWishlistResponse wishListModel;
  final String productId;

  const AddProductToWishlistStateSuccess(this.wishListModel, this.productId);

  @override
  List<Object> get props => [];
}

class WishlistIdleState extends StoreProfileMpState {}

class RemoveFromWishlistStateSuccess extends StoreProfileMpState {
  final BaseModel baseModel;
  final String productId;

  const RemoveFromWishlistStateSuccess(this.baseModel, this.productId);

  @override
  List<Object> get props => [];
}
