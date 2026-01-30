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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_image_upload/product_image_upload_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/save_product_mp_model/save_product_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';

import '../../../mp_models/add_new_product_mp_model/upload_file_data_model/upload_file_data_model.dart';

abstract class AddNewProductMpState {
  const AddNewProductMpState();

  @override
  List<Object> get props => [];
}

class AddNewProductMpInitial extends AddNewProductMpState {}

class AddNewProductMpSuccess extends AddNewProductMpState {
  final AddNewProductMpModel addNewProductMpModel;
  const AddNewProductMpSuccess(this.addNewProductMpModel);
}

class ProductImageUploadMpSuccess extends AddNewProductMpState {
  final ProductImageUploadModel productImageUploadModel;
  const ProductImageUploadMpSuccess(this.productImageUploadModel);
}

class SelectProductsMpSuccess extends AddNewProductMpState {
  final String pageType;
  final SelectProductsMpModel selectProductsMpModel;
  const SelectProductsMpSuccess(this.selectProductsMpModel, this.pageType);
}

class SellerNewProductSaveRequestState extends AddNewProductMpState {
  final SaveProductModel saveproductModel;
  const SellerNewProductSaveRequestState(this.saveproductModel);
}

class AddNewProductMpError extends AddNewProductMpState {
  final String message;
  const AddNewProductMpError(this.message);
}

class AddNewProductMpEmptyState extends AddNewProductMpState {}

class DownlodableFileUploadMpSuccess extends AddNewProductMpState {
  final UploadDownloadableProductFileModel uploadDownloadableProductFileModel;
  final int? index;
  final String? linkId;
  const DownlodableFileUploadMpSuccess(this.uploadDownloadableProductFileModel,this.index,this.linkId);
}

class DownlodableSampleFileUploadMpSuccess extends AddNewProductMpState {
  final UploadDownloadableProductFileModel uploadDownloadableProductFileModel;
  final int? index;
  final String? linkId;
  const DownlodableSampleFileUploadMpSuccess(this.uploadDownloadableProductFileModel,this.index,this.linkId);
}

class SampleFileUploadMpSuccess extends AddNewProductMpState {
  final UploadDownloadableProductFileModel uploadDownloadableProductFileModel;
  const SampleFileUploadMpSuccess(this.uploadDownloadableProductFileModel);
}
