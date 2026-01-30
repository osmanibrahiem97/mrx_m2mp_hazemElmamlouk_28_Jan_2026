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

import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/media_gallery.dart';

class SellerNewProductSaveRequestModel {
  final String? customerToken;
  final String? productId;
  final String? sku;
  final String? urlKey;
  final int? qty;
  final String? type;
  final String? name;
  final String? price;
  final bool? status;
  final int? isFeaturedProduct;
  final String? weight;
  final int? storeId;
  final String? metaTitle;
  final String? thumbnail;
  final String? baseImage;
  final bool? isInStock;
  final String? linksTitle;
  final String? visibility;
  final int? taxClassId;
  final String? smallImage;
  final String? description;
  final String? swatchImage;
  final String? metaKeyword;
  final String? samplesTitle;
  final bool? isDownloadable;
  final int? attributeSetId;
  final String? specialFromDate;
  final String? metaDescription;
  final String? shortDescription;
  final bool? productHasWeight;
  final String? mpProductCartLimit;
  final bool? purchasedSeparately;
  final List? upsell;
  final List? related;
  final List? linksData;
  final List? crossSell;
  final List? websiteIds;
  final List? categoryIds;
  final List? samplesData;
  final List? customAttribute;
  final List? customOptionData;
  final List<Map<String, dynamic>>? mediaGallery;
  final String? specialToDate;
  final String? specialPrice;
  final String? width;
  final String? currency;
  final String? customerAttribute;
  final String? purchaseSeparately;
  final String? quoteld;
  final String? sources;
  final String? websiteId;

  SellerNewProductSaveRequestModel({
    required this.storeId,
    required this.customerToken,
    required this.metaDescription,
    required this.metaKeyword,
    required this.mediaGallery,
    required this.type,
    required this.attributeSetId,
    required this.isFeaturedProduct,
    required this.specialFromDate,
    this.specialToDate,
    this.specialPrice,
    required this.shortDescription,
    required this.description,
    required this.sku,
    required this.price,
    required this.name,
    this.width,
    required this.isDownloadable,
    required this.metaTitle,
    required this.weight,
    required this.visibility,
    required this.qty,
    required this.categoryIds,
    required this.crossSell,
    this.currency,
    this.customerAttribute,
    this.customOptionData,
    required this.isInStock,
    required this.linksData,
    required this.mpProductCartLimit,
    required this.productHasWeight,
    required this.purchaseSeparately,
    this.quoteld,
    required this.related,
    required this.samplesData,
    this.sources,
    required this.taxClassId,
    required this.upsell,
    this.websiteId,
    required this.websiteIds,
    required this.customAttribute,
    required this.purchasedSeparately,
    required this.samplesTitle,
    required this.swatchImage,
    required this.smallImage,
    required this.linksTitle,
    required this.baseImage,
    required this.thumbnail,
    required this.urlKey,
    required this.productId,
    required this.status,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'storeId': storeId,
  //     'customerToken': customerToken,
  //     'metaDescription': metaDescription,
  //     'productId': productId,
  //     'sku': sku,
  //     'urlKey': urlKey,
  //     'qty': qty,
  //     'type': type,
  //     'name': name,
  //     'price': price,
  //     'status': status,
  //     'isFeaturedProduct': isFeaturedProduct,
  //     'weight': weight,
  //     'metaTitle': metaTitle,
  //     'thumbnail': thumbnail,
  //     'baseImage': baseImage,
  //     'isInStock': isInStock,
  //     'linksTitle': linksTitle,
  //     'visibility': visibility,
  //     'taxClassId': taxClassId,
  //     'smallImage': smallImage,
  //     'description': description,
  //     'swatchImage': swatchImage,
  //     'metaKeyword': metaKeyword,
  //     'samplesTitle': samplesTitle,
  //     'isDownloadable': isDownloadable,
  //     'attributeSetId': attributeSetId,
  //     'specialFromDate': specialFromDate,
  //     'shortDescription': shortDescription,
  //     'productHasWeight': productHasWeight,
  //     'mpProductCartLimit': mpProductCartLimit,
  //     'purchasedSeparately': purchasedSeparately,
  //     'upsell': upsell,
  //     'related': related,
  //     'linksData': linksData,
  //     'crossSell': crossSell,
  //     'websiteIds': websiteIds,
  //     'categoryIds': categoryIds,
  //     'samplesData': samplesData,
  //     'customAttribute': customAttribute,
  //     'customOptionData': customOptionData,
  //   };
  // }
}
