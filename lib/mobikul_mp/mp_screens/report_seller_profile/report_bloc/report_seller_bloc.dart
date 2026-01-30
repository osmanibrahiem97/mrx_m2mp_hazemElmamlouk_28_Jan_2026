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
import 'package:test_new/mobikul_mp/mp_screens/report_seller_profile/report_bloc/report_seller_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_seller_profile/report_bloc/report_seller_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_event.dart';
import 'report_seller_state.dart';

class ReportSellerBloc extends Bloc<ReportSellerEvent, ReportSellerState> {
  ReportSellerRepository? repository;

  ReportSellerBloc({this.repository}) : super(ReportSellerInitialState()) {
    on<ReportSellerEvent>(mapEventToState);
  }

  void mapEventToState(
      ReportSellerEvent event, Emitter<ReportSellerState> emit) async {
    if (event is SubmitReportSellerEvent) {
      emit(ReportSellerLoadingState());
      try {
        var model = await repository?.submitReportSeller(
            customerName: event.customerName,
            customerEmail: event.customerEmail,
            otherReason: event.otherReason,
            isOtherReason: event.isOtherReason,
            sellerId: event.sellerId,
            reasonId: event.reasonId);
        if (model != null) {
          if (model.success ?? false) {
            emit(SubmitReportSellerState(model));
          } else {
            emit(ReportSellerErrorState(model.message.toString()));
          }
        } else {
          emit(const ReportSellerErrorState("Something Went Wrong!"));
        }
      } catch (error, _) {
        print(error.toString());
        emit(ReportSellerErrorState(error.toString()));
      }
    }
  }
}
