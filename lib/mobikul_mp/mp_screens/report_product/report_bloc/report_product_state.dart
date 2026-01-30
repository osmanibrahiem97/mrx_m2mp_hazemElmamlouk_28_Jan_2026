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

abstract class ReportProductState {
  const ReportProductState();

  @override
  List<Object?> get props => [];
}

class ReportProductInitialState extends ReportProductState {}

class ReportProductLoadingState extends ReportProductState {}

class ReportProductSuccessState extends ReportProductState {}

class ReportProductErrorState extends ReportProductState {
  final String message;
  const ReportProductErrorState(this.message);
}

class SubmitReportProductState extends ReportProductState {
  final BaseModel data;
  const SubmitReportProductState(this.data);
}

class SubmitReportProductEmptyState extends ReportProductState {}
