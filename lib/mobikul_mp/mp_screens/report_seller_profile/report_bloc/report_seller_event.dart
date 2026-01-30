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

abstract class ReportSellerEvent extends Equatable {
  const ReportSellerEvent();

  @override
  List<Object> get props => [];
}

class SubmitReportSellerEvent extends ReportSellerEvent {
  final String customerName;
  final String customerEmail;
  final String otherReason;
  final bool isOtherReason;
  final int reasonId;
  final int sellerId;

  SubmitReportSellerEvent({
    required this.customerName,
    required this.customerEmail,
    required this.otherReason,
    required this.isOtherReason,
    required this.reasonId,
    required this.sellerId,
  });
}
