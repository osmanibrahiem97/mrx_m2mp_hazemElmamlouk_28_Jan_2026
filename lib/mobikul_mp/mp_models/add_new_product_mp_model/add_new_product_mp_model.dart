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

import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/allowed_attributes.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/allowed_types.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/categories.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/image_role.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/inventory_availability_options.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_data.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/tax_options.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/visibility_options.dart';
part 'add_new_product_mp_model.g.dart';

@JsonSerializable()
class AddNewProductMpModel extends BaseModel {
  @JsonKey(name: "productData")
  ProductData? productData;
  @JsonKey(name: "inventoryAvailabilityOptions")
  List<InventoryAvailabilityOptions>? inventoryAvailabilityOptions;
  @JsonKey(name: "allowedAttributes")
  List<AllowedAttributes>? allowedAttributes;
  @JsonKey(name: "allowedTypes")
  List<AllowedTypes>? allowedTypes;
  @JsonKey(name: "isCategoryTreeAllowed")
  bool? isCategoryTreeAllowed;
  @JsonKey(name: "categories")
  Categories? categories;
  @JsonKey(name: "assignedCategories")
  List<AssignedCategory>? assignedCategories;
  @JsonKey(name: "skuType")
  String? skuType;
  @JsonKey(name: "skuhint")
  String? skuhint;
  @JsonKey(name: "showHint")
  bool? showHint;
  @JsonKey(name: "skuPrefix")
  String? skuPrefix;
  @JsonKey(name: "priceHint")
  String? priceHint;
  @JsonKey(name: "imageHint")
  String? imageHint;
  @JsonKey(name: "weightUnit")
  String? weightUnit;
  @JsonKey(name: "productHint")
  String? productHint;
  @JsonKey(name: "categoryHint")
  String? categoryHint;
  @JsonKey(name: "inventoryHint")
  String? inventoryHint;
  @JsonKey(name: "currencySymbol")
  String? currencySymbol;
  @JsonKey(name: "descriptionHint")
  String? descriptionHint;
  @JsonKey(name: "specialPriceHint")
  String? specialPriceHint;
  @JsonKey(name: "specialEndDateHint")
  String? specialEndDateHint;
  @JsonKey(name: "shortdescriptionHint")
  String? shortdescriptionHint;
  @JsonKey(name: "specialStartDateHint")
  String? specialStartDateHint;
  @JsonKey(name: "addProductLimitStatus")
  bool? addProductLimitStatus;
  @JsonKey(name: "addGlobalProductLimitStatus")
  String? addGlobalProductLimitStatus;
  @JsonKey(name: "addUpsellProductStatus")
  bool? addUpsellProductStatus;
  @JsonKey(name: "addRelatedProductStatus")
  bool? addRelatedProductStatus;
  @JsonKey(name: "addCrosssellProductStatus")
  bool? addCrosssellProductStatus;
  @JsonKey(name: "inventoryAvailabilityHint")
  String? inventoryAvailabilityHint;
  @JsonKey(name: "visibilityOptions")
  List<VisibilityOptions>? visibilityOptions;
  @JsonKey(name: "taxHint")
  String? taxHint;
  @JsonKey(name: "taxOptions")
  List<TaxOptions>? taxOptions;
  @JsonKey(name: "weightHint")
  String? weightHint;
  @JsonKey(name: "imageRole")
  List<ImageRole>? imageRole;
  AddNewProductMpModel({
    this.productData,
    this.inventoryAvailabilityOptions,
    this.allowedAttributes,
    this.allowedTypes,
    this.isCategoryTreeAllowed,
    this.categories,
    this.assignedCategories,
    this.skuType,
    this.skuhint,
    this.showHint,
    this.skuPrefix,
    this.priceHint,
    this.imageHint,
    this.weightUnit,
    this.productHint,
    this.categoryHint,
    this.inventoryHint,
    this.currencySymbol,
    this.descriptionHint,
    this.specialPriceHint,
    this.specialEndDateHint,
    this.shortdescriptionHint,
    this.specialStartDateHint,
    this.addProductLimitStatus,
    this.addGlobalProductLimitStatus,
    this.addUpsellProductStatus,
    this.addRelatedProductStatus,
    this.addCrosssellProductStatus,
    this.inventoryAvailabilityHint,
    this.visibilityOptions,
    this.taxHint,
    this.taxOptions,
    this.weightHint,
    this.imageRole
  });

  factory AddNewProductMpModel.fromJson(Map<String, dynamic> json) =>
      _$AddNewProductMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewProductMpModelToJson(this);
}


@JsonSerializable()
class AssignedCategory{
  String? id;
  String? name;
  bool? isChecked;
  @JsonKey(name: "children")
  List<AssignedCategory>? children;


  AssignedCategory({this.id,this.name,this.children,this.isChecked});

  factory AssignedCategory.fromJson(Map<String, dynamic> json) =>
      _$AssignedCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedCategoryToJson(this);
}