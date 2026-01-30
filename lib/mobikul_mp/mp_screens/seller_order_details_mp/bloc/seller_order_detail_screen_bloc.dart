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
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../../../mp_models/ship_items_createshipment_model/ship_items_createshipment_mp_model.dart';
import '../../seller_order_shipment_mp/bloc/seller_order_shipment_screen_mp_events.dart';
import 'seller_order_detail_mp_repository.dart';

part 'seller_order_detail_event.dart';
part 'seller_order_detail_screen_state.dart';

class SellerOrderDetailMpBloc
    extends Bloc<SellerOrderDetailMpEvent, SellerOrderDetailMpState> {
  SellerOrderDetailMpRepositoryImp? repository;

  SellerOrderDetailMpBloc({this.repository}) : super(SellerOrderDetailMpInitial()) {
    on<SellerOrderDetailMpEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
      SellerOrderDetailMpEvent event, Emitter<SellerOrderDetailMpState> emit) async {
    if (event is SellerOrderDetailFetchEvent) {
      emit(SellerOrderDetailMpInitial());
      try {
        var model = await repository?.getSellerOrderMpDetails(event.increementId, event.sellerId);
        if (model != null) {
          emit(SellerOrderDetailMpSuccess(model));
        } else {
          emit(SellerOrderDetailMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
    else if(event is SellerReorderEvent) {
      try {
        emit(SellerOrderDetailMpInitial());
        var model = await repository?.reorder(event.incrementId);
        if (model != null) {
          if (model.success == true) {
            emit(ReorderMpSuccessState(model));
          } else {
            emit(SellerOrderDetailMpError(''));
          }
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
    else if(event is SellerCreateInvoiceEvent) {
      try {
        emit(SellerOrderDetailMpInitial());
        var model = await repository?.getSellerOrderCreateInvoice(event.incrementId);
        if (model != null) {
          if (model.success == true) {
            emit(CreateInvoiceMpStateSuccess(model));
          } else {
            emit(SellerOrderDetailMpError(model?.message.toString() ?? ""));
          }
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
    else if(event is CancelOrderEvent) {
      try {
        emit(SellerOrderDetailMpInitial());
        var model = await repository?.getSellerCancelOrder(event.incrementId);
        if (model != null) {
          if (model.success == true) {
            emit(CancelInvoiceMpSuccess(model));
          } else {
            emit(SellerOrderDetailMpError(''));
          }
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
    else if(event is CreateShipmentEvent) {
      try {
        emit(SellerOrderDetailMpInitial());
        var model = await repository?.getSellerCreateShipment(event.incrementId, event.carrierData,event.trackingData);
        if (model != null) {
          if (model.success == true) {
            emit(CreateShipmentMpSuccess(model));
          } else {
            emit(SellerOrderDetailMpError(''));
          }
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
    else if(event is OrderMailSentEvent) {
      try {
        emit(SellerOrderDetailMpInitial());
        var model = await repository?.getSendOrderEmail(event.incrementId);
        if (model != null) {
            emit(OrderSentMailMpSuccess(model));
        } else {
          emit(SellerOrderDetailMpError(''));
        }
      } catch (error, _) {
        print(error.toString());
        emit(SellerOrderDetailMpError(error.toString()));
      }
    }
  }
}
