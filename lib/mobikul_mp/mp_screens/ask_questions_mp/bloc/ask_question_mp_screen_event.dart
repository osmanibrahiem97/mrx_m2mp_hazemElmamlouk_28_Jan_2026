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

abstract class AskQuestionMpEvent extends Equatable {
  const AskQuestionMpEvent();

  @override
  List<Object> get props => [];
}

class SubmitAskQuestionEvent extends AskQuestionMpEvent {
  final String query;
  final String subject;

  const SubmitAskQuestionEvent(this.query, this.subject);
}
