
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

part of 'seller_order_detail_screen_bloc.dart';

abstract class SellerOrderDetailMpEvent extends Equatable{
  const SellerOrderDetailMpEvent();

  @override
  List<Object> get props => [];
}

class SellerOrderDetailFetchEvent extends SellerOrderDetailMpEvent{
  final String? increementId;
  final String? sellerId;
  const SellerOrderDetailFetchEvent(this.increementId, this.sellerId);

  @override
  List<Object> get props => [];
}

class SellerReorderEvent extends SellerOrderDetailMpEvent{
  final String incrementId;
  const SellerReorderEvent(this.incrementId);

  @override
  List<Object> get props => [];
}

class SellerCreateInvoiceEvent extends SellerOrderDetailMpEvent{
  final String? incrementId;
  const SellerCreateInvoiceEvent(this.incrementId);

  @override
  List<Object> get props => [];
}

class CancelOrderEvent extends SellerOrderDetailMpEvent{
  final String incrementId;
  const CancelOrderEvent(this.incrementId);

  @override
  List<Object> get props => [];
}

class OrderMailSentEvent extends SellerOrderDetailMpEvent{
  final String incrementId;
  const OrderMailSentEvent(this.incrementId);

  @override
  List<Object> get props => [];
}


class CreateShipmentEvent extends SellerOrderDetailMpEvent{
  final String incrementId;
  final String carrierData;
  final String trackingData;
  const CreateShipmentEvent(this.incrementId,this.carrierData, this.trackingData);

  @override
  List<Object> get props => [];
}


class SaveShipItemsEvent extends SellerOrderDetailMpEvent {
  final String carrierData,  trackingNumber;

  const SaveShipItemsEvent(this.carrierData, this.trackingNumber);

  @override
  List<Object> get props => [];
}
