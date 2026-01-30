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

abstract class WriteToUsState {
  const WriteToUsState();

  @override
  List<Object?> get props => [];
}

class WriteToUsInitialState extends WriteToUsState {}

class WriteToUsLoadingState extends WriteToUsState {}

class WriteToUsSuccessState extends WriteToUsState {}

class WriteToUsErrorState extends WriteToUsState {
  final String message;
  const WriteToUsErrorState(this.message);
}

class SubmitWriteToUsState extends WriteToUsState {
  final BaseModel data;
  const SubmitWriteToUsState(this.data);
}

class SubmitWriteToUsEmptyState extends WriteToUsState {}
