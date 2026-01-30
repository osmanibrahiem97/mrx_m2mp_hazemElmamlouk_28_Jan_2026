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

abstract class WriteToUsEvent extends Equatable {
  const WriteToUsEvent();

  @override
  List<Object> get props => [];
}

class SubmitWriteToUsEvent extends WriteToUsEvent {
  final String query;
  final String subject;
  final int sellerId;

  SubmitWriteToUsEvent(this.query, this.subject, this.sellerId);
}
