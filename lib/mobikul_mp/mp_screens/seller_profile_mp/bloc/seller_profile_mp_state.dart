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
import 'package:test_new/mobikul/models/account_info/account_info_model.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/upload_banner_mp_model.dart';

abstract class SellerProfileMpState extends Equatable {
  const SellerProfileMpState();

  @override
  List<Object> get props => [];
}

class SellerProfileMpInitial extends SellerProfileMpState {}

class SellerProfileMpSuccess extends SellerProfileMpState {
  final SellerProfileMpModel sellerProfileMpModel;
  const SellerProfileMpSuccess(this.sellerProfileMpModel);
}

class SellerProfileMpError extends SellerProfileMpState {
  final String message;
  const SellerProfileMpError(this.message);
}

class AddImageState extends SellerProfileMpState {
  final SellerProfileMpModel? model;
  final String? type;
  const AddImageState(this.model, this.type);
}

class DeleteImageState extends SellerProfileMpState {
  final BaseModel? model;
  final String? type;
  const DeleteImageState(this.model, this.type);
}

class ImageUploadSuccessState extends SellerProfileMpState {
  final BaseModel? model;
  const ImageUploadSuccessState(this.model);
}

class SellerProfileSaveRequestState extends SellerProfileMpState {
  final BaseModel baseModel;
  const SellerProfileSaveRequestState(this.baseModel);
}

class SellerProfileMpEmptyState extends SellerProfileMpState {}
