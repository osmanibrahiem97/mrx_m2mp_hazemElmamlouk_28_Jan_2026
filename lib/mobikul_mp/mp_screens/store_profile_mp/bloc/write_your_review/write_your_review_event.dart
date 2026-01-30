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

abstract class WriteYourReviewEvent extends Equatable {
  const WriteYourReviewEvent();

  @override
  List<Object> get props => [];
}

class SubmitWriteYourReviewEvent extends WriteYourReviewEvent {
  final String shopUrl;
  final String nickName;
  final String summary;
  final String sellerId;
  final double priceRating;
  final double valueRating;
  final String description;
  final String customerEmail;
  final double qualityRating;

  SubmitWriteYourReviewEvent(
      this.shopUrl,
      this.nickName,
      this.summary,
      this.sellerId,
      this.priceRating,
      this.valueRating,
      this.description,
      this.customerEmail,
      this.qualityRating);
}
