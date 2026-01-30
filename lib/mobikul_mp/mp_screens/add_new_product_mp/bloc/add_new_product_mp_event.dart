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
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/seller_new_product_save_request.dart';

abstract class AddNewProductMpEvent extends Equatable {
  const AddNewProductMpEvent();

  @override
  List<Object> get props => [];
}

class AddNewProductMpFetchEvent extends AddNewProductMpEvent {
  final int productId;
  const AddNewProductMpFetchEvent(this.productId);
}

class ProductImageUploadMpEvent extends AddNewProductMpEvent {
  final String imageEncoded;
  final String imageName;
  const ProductImageUploadMpEvent(this.imageEncoded, this.imageName);
}

class SellerNewProductSaveRequestEvent extends AddNewProductMpEvent {
  final SellerNewProductSaveRequestModel sellerNewProductSaveRequestModel;
  final int productId;
  const SellerNewProductSaveRequestEvent(
      this.sellerNewProductSaveRequestModel, this.productId);
}

class SelectProductsMpFetchEvent extends AddNewProductMpEvent {
  final int pageNumber;
  final String pageType;
  final int width;
  final String filterData;
  final String sortData;
  final int onlySelected;
  final int productId;
  const SelectProductsMpFetchEvent(
      {required this.pageNumber,
      required this.pageType,
      required this.width,
      required this.filterData,
      required this.sortData,
      required this.onlySelected,
      required this.productId});
}

class DownlodableFileUploadMpEvent extends AddNewProductMpEvent{
  final String fileName;
  final String fileType;
  final String fileEncoded;
  final int? index;
  final String? linkId;

  const DownlodableFileUploadMpEvent(this.fileName, this.fileType, this.fileEncoded,this.index,this.linkId);
}

class DownlodableSampleFileUploadMpEvent extends AddNewProductMpEvent{
  final String fileName;
  final String fileType;
  final String fileEncoded;
  final int? index;
  final String? linkId;

  const DownlodableSampleFileUploadMpEvent(this.fileName, this.fileType, this.fileEncoded,this.index,this.linkId);
}

class SampleFileUploadMpEvent extends AddNewProductMpEvent{
  final String fileName;
  final String fileType;
  final String fileEncoded;

  const SampleFileUploadMpEvent(this.fileName, this.fileType, this.fileEncoded);
}
