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

abstract class CustomerMpEvent extends Equatable {
  const CustomerMpEvent();

  @override
  List<Object> get props => [];
}

class CustomerFetchEvent extends CustomerMpEvent {
  final String? gender;
  final String? email;
  final String? name;
  final String? billingTelephone;
  final String? billingFull;
  final int? websiteId;
  const CustomerFetchEvent(this.gender, this.name, this.email, this.billingFull,
      this.billingTelephone, this.websiteId);
}
