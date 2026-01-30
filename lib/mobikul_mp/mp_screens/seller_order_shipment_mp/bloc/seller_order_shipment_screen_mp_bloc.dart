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
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/bloc/seller_order_shipment_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/bloc/seller_order_shipment_screen_mp_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/bloc/seller_order_shipment_screen_mp_state.dart';


class SellerOrderShipmentScreenMpBloc extends Bloc<SellerOrderShipmentScreenMpEvent, SellerOrderShipmentScreenMpState> {
  SellerOrderShipmentScreenRepositoryImp? repository;

  SellerOrderShipmentScreenMpBloc({this.repository}) : super(SellerOrderShipmentScreenMpInitial()) {
    on<SellerOrderShipmentScreenMpEvent>(mapEventToState);
  }

  void mapEventToState(
      SellerOrderShipmentScreenMpEvent event, Emitter<SellerOrderShipmentScreenMpState> emit) async {
    if (event is SellerOrderShipmentDetailsMpFetchEvent) {
      emit(SellerOrderShipmentScreenMpInitial());
      try {
        var model = await repository?.getSellerOrderShipmentList(event.increementId, event.shipmentId);
        if (model != null) {
          emit(SellerOrderShipmentScreenMpSuccess(model));
        } else {
          emit(const SellerOrderShipmentScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderShipmentScreenMpError(error.toString()));
      }
    }
    if (event is SendShipmentEvent) {
      emit(SellerOrderShipmentScreenMpInitial());

      try {
        var model = await repository?.getSendtrackInformationData(event.increementId,event.shipmentId);
        if (model != null) {
          emit( SendtrackingInformationSuccess(model));
        } else {
          emit(SellerOrderShipmentScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderShipmentScreenMpError(error.toString()));
      }
    }
    if (event is DownloadAllShipmentEvent) {
      emit(SellerOrderShipmentScreenMpInitial());

      try {
        var model = await repository?.getDownloadAllShipmentView(event.dateTo,event.dateFrom, event.shipmentId, event.increementId);
        if (model != null) {
          emit( SellerOrderShipmentScreenSuccess(model));
        } else {
          emit(SellerOrderShipmentScreenMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderShipmentScreenMpError(error.toString()));
      }
    } else if(event is SellerOrderMailSentEvent){
      emit(SellerOrderShipmentScreenMpInitial());
      try {
        var model = await repository?.getSendOrderEmail(event.incrementId);
        if (model != null) {
          emit( SellerOrderSentMailMpSuccess(model));
        } else {
          emit(SellerOrderShipmentScreenMpError(''));
        }
      } catch (error, _) {
      print(error.toString());
     emit(SellerOrderShipmentScreenMpError(error.toString()));
      }
    }
  }
}
