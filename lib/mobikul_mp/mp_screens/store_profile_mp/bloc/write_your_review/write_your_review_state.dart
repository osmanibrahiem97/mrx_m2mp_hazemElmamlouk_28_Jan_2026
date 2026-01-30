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

abstract class WriteYourReviewState {
  const WriteYourReviewState();

  @override
  List<Object?> get props => [];
}

class WriteYourReviewInitialState extends WriteYourReviewState {}

class WriteYourReviewLoadingState extends WriteYourReviewState {}

class WriteYourReviewSuccessState extends WriteYourReviewState {}

class WriteYourReviewErrorState extends WriteYourReviewState {
  final String message;
  const WriteYourReviewErrorState(this.message);
}

class SubmitReviewState extends WriteYourReviewState {
  final BaseModel data;
  const SubmitReviewState(this.data);
}

class WriteYourReviewEmptyState extends WriteYourReviewState {}
