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
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_state.dart';

class ReportProductBloc extends Bloc<ReportProductEvent, ReportProductState> {
  ReportProductRepository? repository;

  ReportProductBloc({this.repository}) : super(ReportProductInitialState()) {
    on<ReportProductEvent>(mapEventToState);
  }

  void mapEventToState(
      ReportProductEvent event, Emitter<ReportProductState> emit) async {
    if (event is SubmitReportProductEvent) {
      emit(ReportProductLoadingState());
      try {
        var model = await repository?.submitReportProduct(
            customerName: event.customerName,
            customerEmail: event.customerEmail,
            otherReason: event.otherReason,
            isOtherReason: event.isOtherReason,
            productId: event.productId,
            reasonId: event.reasonId);
        if (model != null) {
          if (model.success ?? false) {
            emit(SubmitReportProductState(model));
          } else {
            emit(ReportProductErrorState(model.message.toString()));
          }
        } else {
          emit(const ReportProductErrorState("Something Went Wrong!"));
        }
      } catch (error, _) {
        print(error.toString());
        emit(ReportProductErrorState(error.toString()));
      }
    } else if( event is ReportProductInitialEvent){
      emit(ReportProductInitialState());
    }
  }
}
