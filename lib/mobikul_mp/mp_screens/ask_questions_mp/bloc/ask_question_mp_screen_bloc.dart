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
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_state.dart';

class AskQuestionMpBloc extends Bloc<AskQuestionMpEvent, AskQuestionMpState> {
  AskQuestionMpRepository? repository;

  AskQuestionMpBloc({this.repository}) : super(AskQuestionInitialState()) {
    on<AskQuestionMpEvent>(mapEventToState);
  }

  void mapEventToState(
      AskQuestionMpEvent event, Emitter<AskQuestionMpState> emit) async {
    if (event is SubmitAskQuestionEvent) {
      emit(AskQuestionLoadingState());
      try {
        var model =
            await repository?.submitAskQuestion(event.query, event.subject);
        if (model != null) {
          if (model.success ?? false) {
            emit(SubmitAskQuestionState(model));
          } else {
            emit(AskQuestionErrorState(model.message.toString()));
          }
        } else {
          emit(const AskQuestionErrorState(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        print(error.toString());
        emit(AskQuestionErrorState(error.toString()));
      }
    }
  }
}
