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
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/widgets/seller_profile_save_request.dart';

abstract class SellerProfileMpEvent extends Equatable {
  const SellerProfileMpEvent();

  @override
  List<Object> get props => [];
}

class SellerProfileMpFetchEvent extends SellerProfileMpEvent {
  const SellerProfileMpFetchEvent();
}

class AddImageEvent extends SellerProfileMpEvent {
  final String image;
  final String type;
  const AddImageEvent(this.image, this.type);
}

class DeleteProfileEvent extends SellerProfileMpEvent {
  final String entity;
  const DeleteProfileEvent(this.entity);
}

class SellerProfileSaveRequestEvent extends SellerProfileMpEvent {
  final SellerProfileSaveRequestModel sellerProfileSaveRequestModel;

  const SellerProfileSaveRequestEvent(this.sellerProfileSaveRequestModel);
}
