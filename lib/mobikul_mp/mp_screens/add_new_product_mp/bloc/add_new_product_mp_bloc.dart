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

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_state.dart';

class AddNewProductMpBloc
    extends Bloc<AddNewProductMpEvent, AddNewProductMpState> {
  AddNewProductMpRepositoryImp? repository;

  AddNewProductMpBloc({this.repository}) : super(AddNewProductMpInitial()) {
    on<AddNewProductMpEvent>(mapEventToState);
  }

  void mapEventToState(
      AddNewProductMpEvent event, Emitter<AddNewProductMpState> emit) async {
    if (event is AddNewProductMpFetchEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.getAddNewProductMpData(event.productId);
        if (model != null) {
          emit(AddNewProductMpSuccess(model));
        } else {
          emit(
              const AddNewProductMpError(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    } else if (event is ProductImageUploadMpEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.uploadProductMp(
          imageEncoded: event.imageEncoded,
          imageName: event.imageName,
        );
        if (model != null) {
          emit(ProductImageUploadMpSuccess(model));
        } else {
          emit(
              const AddNewProductMpError(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    } else if (event is SellerNewProductSaveRequestEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.sellerNewProductSaveRequest(
            event.sellerNewProductSaveRequestModel, event.productId);
        if (model != null) {
          if (model.success ?? false) {
            emit(SellerNewProductSaveRequestState(model));
          } else {
            emit(AddNewProductMpError(model.message.toString()));
          }
        } else {
          emit(
              const AddNewProductMpError(MpStringConstants.somethingWentWrong));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    }
    if (event is SelectProductsMpFetchEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.getSelectProductsMpData(
          pageType: event.pageType,
          width: event.width,
          pageNumber: event.pageNumber,
          filterData: event.filterData,
          sortData: event.sortData,
          onlySelected: event.onlySelected,
          productId: event.productId,
        );

        if (model != null) {
          emit(SelectProductsMpSuccess(model, event.pageType));
        } else {
          emit(const AddNewProductMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    }if (event is DownlodableFileUploadMpEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.uploadDownlodableProductFile(
            event.fileName,
            event.fileEncoded,
            event.fileType,
        );
        if (model != null) {
          emit(DownlodableFileUploadMpSuccess(model,event.index,event.linkId));
        } else {
          emit(const AddNewProductMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    } else if (event is DownlodableSampleFileUploadMpEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.uploadDownlodableProductFile(
            event.fileName,
            event.fileEncoded,
            event.fileType
        );
        if (model != null) {
          emit(DownlodableSampleFileUploadMpSuccess(model,event.index,event.linkId));
        } else {
          emit(const AddNewProductMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    } else if (event is SampleFileUploadMpEvent) {
      emit(AddNewProductMpInitial());
      try {
        var model = await repository?.uploadDownlodableProductFile(
            event.fileName,
            event.fileEncoded,
            event.fileType
        );
        if (model != null) {
          emit(SampleFileUploadMpSuccess(model));
        } else {
          emit(const AddNewProductMpError(''));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(AddNewProductMpError(error.toString()));
      }
    }
  }
}
