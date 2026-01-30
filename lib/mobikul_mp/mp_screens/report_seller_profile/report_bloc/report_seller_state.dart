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

import 'package:test_new/mobikul/models/base_model.dart';

abstract class ReportSellerState {
  const ReportSellerState();

  @override
  List<Object?> get props => [];
}

class ReportSellerInitialState extends ReportSellerState {}

class ReportSellerLoadingState extends ReportSellerState {}

class ReportSellerSuccessState extends ReportSellerState {}

class ReportSellerErrorState extends ReportSellerState {
  final String message;
  const ReportSellerErrorState(this.message);
}

class SubmitReportSellerState extends ReportSellerState {
  final BaseModel data;
  const SubmitReportSellerState(this.data);
}

class SubmitReportSellerEmptyState extends ReportSellerState {}
