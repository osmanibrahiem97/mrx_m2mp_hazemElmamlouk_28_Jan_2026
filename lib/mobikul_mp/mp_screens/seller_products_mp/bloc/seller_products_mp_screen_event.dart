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

abstract class SellerProductsMpEvent extends Equatable {
  const SellerProductsMpEvent();

  @override
  List<Object> get props => [];
}

class SellerProductsMpFetchEvent extends SellerProductsMpEvent {
  final int page;
  const SellerProductsMpFetchEvent(this.page);
}

class SellerProductDeleteEvent extends SellerProductsMpEvent {
  final String productId;
  final int index;
  const SellerProductDeleteEvent(this.productId, this.index);
}
