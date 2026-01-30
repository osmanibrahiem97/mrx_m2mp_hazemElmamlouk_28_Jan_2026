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
import 'package:test_new/mobikul/models/base_model.dart';

abstract class AskQuestionMpState extends Equatable {
  const AskQuestionMpState();

  @override
  List<Object> get props => [];
}

class AskQuestionInitialState extends AskQuestionMpState {}

class AskQuestionLoadingState extends AskQuestionMpState {}

class AskQuestionSuccessState extends AskQuestionMpState {}

class AskQuestionErrorState extends AskQuestionMpState {
  final String message;
  const AskQuestionErrorState(this.message);
}

class SubmitAskQuestionState extends AskQuestionMpState {
  final BaseModel data;
  const SubmitAskQuestionState(this.data);
}

class SubmitAskQuestionEmptyState extends AskQuestionMpState {}
