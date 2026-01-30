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

abstract class SellerOrderShipmentScreenMpEvent extends Equatable{
  const SellerOrderShipmentScreenMpEvent();

  @override
  List<Object> get props => [];
}


class SellerOrderShipmentDetailsMpFetchEvent extends SellerOrderShipmentScreenMpEvent{
  final String? increementId;
  final String? shipmentId;
  const SellerOrderShipmentDetailsMpFetchEvent(this.increementId, this.shipmentId);
}

class PrintShipmentEvent extends SellerOrderShipmentScreenMpEvent{
  final String? invoiceId;

  const PrintShipmentEvent(this.invoiceId);

  @override
  List<Object> get props => [];

}

class SendShipmentEvent extends SellerOrderShipmentScreenMpEvent{
  final String? increementId;
  final String? shipmentId;

  const SendShipmentEvent(this.increementId,this.shipmentId);

  @override
  List<Object> get props => [];

}

class DownloadAllShipmentEvent extends SellerOrderShipmentScreenMpEvent{
  final String? dateTo;
  final String? dateFrom;
  final String? increementId;
  final String? shipmentId;

  const DownloadAllShipmentEvent(this.dateTo,this.dateFrom, this.shipmentId, this.increementId);

  @override
  List<Object> get props => [];

}

class SellerOrderMailSentEvent extends SellerOrderShipmentScreenMpEvent{
  final String incrementId;
  const SellerOrderMailSentEvent(this.incrementId);

  @override
  List<Object> get props => [];
}
