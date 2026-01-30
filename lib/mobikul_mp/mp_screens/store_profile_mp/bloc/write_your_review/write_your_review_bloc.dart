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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_state.dart';

class WriteYourReviewBloc
    extends Bloc<WriteYourReviewEvent, WriteYourReviewState> {
  WriteYourReviewRepository? repository;

  WriteYourReviewBloc({this.repository})
      : super(WriteYourReviewInitialState()) {
    on<WriteYourReviewEvent>(mapEventToState);
  }

  void mapEventToState(
      WriteYourReviewEvent event, Emitter<WriteYourReviewState> emit) async {
    if (event is SubmitWriteYourReviewEvent) {
      emit(WriteYourReviewLoadingState());
      try {
        var model = await repository?.submitWriteYourReview(
            event.shopUrl,
            event.nickName,
            event.summary,
            event.sellerId,
            event.priceRating,
            event.valueRating,
            event.description,
            event.customerEmail,
            event.qualityRating);
        if (model != null) {
          if (model.success ?? false) {
            emit(SubmitReviewState(model));
          } else {
            emit(WriteYourReviewErrorState(model.message.toString()));
          }
        } else {
          emit(const WriteYourReviewErrorState('Something Went Wrong!'));
        }
      } catch (error, _) {
        print(error.toString());
        emit(WriteYourReviewErrorState(error.toString()));
      }
    }
  }
}
