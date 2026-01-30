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
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_state.dart';

class WriteToUsBloc extends Bloc<WriteToUsEvent, WriteToUsState> {
  WriteToUsRepository? repository;

  WriteToUsBloc({this.repository}) : super(WriteToUsInitialState()) {
    on<WriteToUsEvent>(mapEventToState);
  }

  void mapEventToState(
      WriteToUsEvent event, Emitter<WriteToUsState> emit) async {
    if (event is SubmitWriteToUsEvent) {
      emit(WriteToUsLoadingState());
      try {
        var model = await repository?.submitWriteToUs(
            event.query, event.subject, event.sellerId);
        if (model != null) {
          if (model.success ?? false) {
            emit(SubmitWriteToUsState(model));
          } else {
            emit(WriteToUsErrorState(model.message.toString()));
          }
        } else {
          emit(const WriteToUsErrorState('something went wrong'));
        }
      } catch (error, _) {
        print(error.toString());
        emit(WriteToUsErrorState(error.toString()));
      }
    }
  }
}
