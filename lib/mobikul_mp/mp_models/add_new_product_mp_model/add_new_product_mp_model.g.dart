// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_product_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewProductMpModel _$AddNewProductMpModelFromJson(
        Map<String, dynamic> json) =>
    AddNewProductMpModel(
      productData: json['productData'] == null
          ? null
          : ProductData.fromJson(json['productData'] as Map<String, dynamic>),
      inventoryAvailabilityOptions: (json['inventoryAvailabilityOptions']
              as List<dynamic>?)
          ?.map((e) =>
              InventoryAvailabilityOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedAttributes: (json['allowedAttributes'] as List<dynamic>?)
          ?.map((e) => AllowedAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedTypes: (json['allowedTypes'] as List<dynamic>?)
          ?.map((e) => AllowedTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCategoryTreeAllowed: json['isCategoryTreeAllowed'] as bool?,
      categories: json['categories'] == null
          ? null
          : Categories.fromJson(json['categories'] as Map<String, dynamic>),
      assignedCategories: (json['assignedCategories'] as List<dynamic>?)
          ?.map((e) => AssignedCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      skuType: json['skuType'] as String?,
      skuhint: json['skuhint'] as String?,
      showHint: json['showHint'] as bool?,
      skuPrefix: json['skuPrefix'] as String?,
      priceHint: json['priceHint'] as String?,
      imageHint: json['imageHint'] as String?,
      weightUnit: json['weightUnit'] as String?,
      productHint: json['productHint'] as String?,
      categoryHint: json['categoryHint'] as String?,
      inventoryHint: json['inventoryHint'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      descriptionHint: json['descriptionHint'] as String?,
      specialPriceHint: json['specialPriceHint'] as String?,
      specialEndDateHint: json['specialEndDateHint'] as String?,
      shortdescriptionHint: json['shortdescriptionHint'] as String?,
      specialStartDateHint: json['specialStartDateHint'] as String?,
      addProductLimitStatus: json['addProductLimitStatus'] as bool?,
      addGlobalProductLimitStatus:
          json['addGlobalProductLimitStatus'] as String?,
      addUpsellProductStatus: json['addUpsellProductStatus'] as bool?,
      addRelatedProductStatus: json['addRelatedProductStatus'] as bool?,
      addCrosssellProductStatus: json['addCrosssellProductStatus'] as bool?,
      inventoryAvailabilityHint: json['inventoryAvailabilityHint'] as String?,
      visibilityOptions: (json['visibilityOptions'] as List<dynamic>?)
          ?.map((e) => VisibilityOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxHint: json['taxHint'] as String?,
      taxOptions: (json['taxOptions'] as List<dynamic>?)
          ?.map((e) => TaxOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      weightHint: json['weightHint'] as String?,
      imageRole: (json['imageRole'] as List<dynamic>?)
          ?.map((e) => ImageRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..otherError = json['otherError'] as String?
      ..redirect = json['redirect'] as String?
      ..eTag = json['eTag'] as String?
      ..cartCount = (json['cartCount'] as num?)?.toInt();

Map<String, dynamic> _$AddNewProductMpModelToJson(
        AddNewProductMpModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otherError': instance.otherError,
      'redirect': instance.redirect,
      'eTag': instance.eTag,
      'cartCount': instance.cartCount,
      'productData': instance.productData,
      'inventoryAvailabilityOptions': instance.inventoryAvailabilityOptions,
      'allowedAttributes': instance.allowedAttributes,
      'allowedTypes': instance.allowedTypes,
      'isCategoryTreeAllowed': instance.isCategoryTreeAllowed,
      'categories': instance.categories,
      'assignedCategories': instance.assignedCategories,
      'skuType': instance.skuType,
      'skuhint': instance.skuhint,
      'showHint': instance.showHint,
      'skuPrefix': instance.skuPrefix,
      'priceHint': instance.priceHint,
      'imageHint': instance.imageHint,
      'weightUnit': instance.weightUnit,
      'productHint': instance.productHint,
      'categoryHint': instance.categoryHint,
      'inventoryHint': instance.inventoryHint,
      'currencySymbol': instance.currencySymbol,
      'descriptionHint': instance.descriptionHint,
      'specialPriceHint': instance.specialPriceHint,
      'specialEndDateHint': instance.specialEndDateHint,
      'shortdescriptionHint': instance.shortdescriptionHint,
      'specialStartDateHint': instance.specialStartDateHint,
      'addProductLimitStatus': instance.addProductLimitStatus,
      'addGlobalProductLimitStatus': instance.addGlobalProductLimitStatus,
      'addUpsellProductStatus': instance.addUpsellProductStatus,
      'addRelatedProductStatus': instance.addRelatedProductStatus,
      'addCrosssellProductStatus': instance.addCrosssellProductStatus,
      'inventoryAvailabilityHint': instance.inventoryAvailabilityHint,
      'visibilityOptions': instance.visibilityOptions,
      'taxHint': instance.taxHint,
      'taxOptions': instance.taxOptions,
      'weightHint': instance.weightHint,
      'imageRole': instance.imageRole,
    };

AssignedCategory _$AssignedCategoryFromJson(Map<String, dynamic> json) =>
    AssignedCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => AssignedCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChecked: json['isChecked'] as bool?,
    );

Map<String, dynamic> _$AssignedCategoryToJson(AssignedCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isChecked': instance.isChecked,
      'children': instance.children,
    };
