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

abstract class StoreProfileMpEvent extends Equatable {
  const StoreProfileMpEvent();

  @override
  List<Object> get props => [];
}

class StoreProfileMpFetchEvent extends StoreProfileMpEvent {
  int? sellerId;
  String currency;
  int? width;
  StoreProfileMpFetchEvent(this.sellerId, this.currency, this.width);
  @override
  List<Object> get props => [];
}

class SubmitSellerReportEvent extends StoreProfileMpEvent {
  final String name;
  final String email;
  final String reason;
  final String isOtherReason;
  final String reasonId;
  final int sellerId;
  const SubmitSellerReportEvent(
      {required this.name,
      required this.email,
      required this.isOtherReason,
      required this.reason,
      required this.reasonId,
      required this.sellerId});

  @override
  List<Object> get props => [];
}

//add to wishlist
class AddToWishlistEvent extends StoreProfileMpEvent {
  String? productId;
  AddToWishlistEvent(
    this.productId,
  );
}

//remove from wishlist
class RemoveFromWishlistEvent extends StoreProfileMpEvent {
  String? productId;
  RemoveFromWishlistEvent(this.productId);
}
