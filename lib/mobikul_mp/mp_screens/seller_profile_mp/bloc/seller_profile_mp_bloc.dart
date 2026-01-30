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

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';

class SellerProfileMpBloc
    extends Bloc<SellerProfileMpEvent, SellerProfileMpState> {
  SellerProfileMpRepositoryImp? repository;

  SellerProfileMpBloc({this.repository}) : super(SellerProfileMpInitial()) {
    on<SellerProfileMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerProfileMpEvent event, Emitter<SellerProfileMpState> emit) async {
    if (event is SellerProfileMpFetchEvent) {
      emit(SellerProfileMpInitial());
      try {
        var model = await repository?.getSellerProfileMpData();
        if (model != null) {
          if (model.success ?? false) {
            emit(SellerProfileMpSuccess(model));
          } else {
            emit(SellerProfileMpError(model.message.toString()));
          }
        } else {
          emit(
              const SellerProfileMpError(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProfileMpError(error.toString()));
      }
    } else if (event is AddImageEvent) {
      emit(SellerProfileMpInitial());
      try {
        var model = await repository?.setImage(event.image, event.type);
        if (model != null) {
          if (model.success ?? false) {
            emit(AddImageState(model, event.type));
          } else {
            emit(SellerProfileMpError(model.message.toString()));
          }
        } else {
          emit(const SellerProfileMpError('Something went wrong! try Again...'));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProfileMpError(error.toString()));
      }
    } else if (event is DeleteProfileEvent) {
      emit(SellerProfileMpInitial());
      try {
        var model = await repository?.deleteSellerImage(event.entity);
        if (model != null) {
          emit(DeleteImageState(model, event.entity));
        } else {
          print('Something went wrong!');

          emit(
              const SellerProfileMpError('Something went wrong! try Again...'));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProfileMpError(error.toString()));
      }
    } else if (event is SellerProfileSaveRequestEvent) {
      emit(SellerProfileMpInitial());
      try {
        var model = await repository
            ?.sellerProfileSaveRequest(event.sellerProfileSaveRequestModel);
        if (model != null) {
          if (model.success ?? false) {
            emit(SellerProfileSaveRequestState(model));
          } else {
            emit(SellerProfileMpError(model.message.toString()));
          }
        } else {
          emit(
              const SellerProfileMpError(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(SellerProfileMpError(error.toString()));
      }
    }
  }
}
