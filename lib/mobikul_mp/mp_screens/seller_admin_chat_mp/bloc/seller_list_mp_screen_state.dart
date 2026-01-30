
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

import '../../../../mobikul/models/base_model.dart';
import '../../../mp_models/seller_list_mp/seller_list_mp_model.dart';


abstract class SellerListMpState extends Equatable {
  const SellerListMpState();

  @override
  List<Object> get props => [];
}

class SellerListMpInitial extends SellerListMpState {}

class SellerListMpSuccess extends SellerListMpState {
  SellerListMpModel? data;
  SellerListMpSuccess(this.data);
}

class SellerListMpError extends SellerListMpState {
  final String message;
  const SellerListMpError(this.message);
}

class SellerListMpSearch extends SellerListMpState {
  final String query;
  const SellerListMpSearch(this.query);
}

class SellerAdminChatAdminNotifiState extends SellerListMpState{
  final BaseModel model;
  const SellerAdminChatAdminNotifiState(this.model);
}


class SellerListMpEmpty extends SellerListMpState {}