

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

abstract class SellerListMpEvent extends Equatable {
  const SellerListMpEvent();

  @override
  List<Object> get props => [];
}

class SellerListMpFetchEvent extends SellerListMpEvent {
  final String query;
  const SellerListMpFetchEvent(this.query);
}

class SellerAdminChatAdminNotifyEvent extends SellerListMpEvent {
  final String message;
  final String sellerName;
  final bool isAdmin;
  final int sellerId;
  const SellerAdminChatAdminNotifyEvent(this.message,this.sellerName, this.isAdmin, this.sellerId);
}

