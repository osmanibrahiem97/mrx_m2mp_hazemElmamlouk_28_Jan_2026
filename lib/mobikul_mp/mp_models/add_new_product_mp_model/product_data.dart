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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/media_gallery.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/sample_list_data_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';

import '../../../mobikul/models/productDetail/link_data.dart';
part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "websiteIds")
  List<String>? websiteIds;
  @JsonKey(name: "attributeSetId")
  String? attributeSetId;
  @JsonKey(name: "categoryIds")
  List<String>? categoryIds;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "shortDescription")
  String? shortDescription;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "specialPrice")
  String? specialPrice;
  @JsonKey(name: "specialFromDate")
  String? specialFromDate;
  @JsonKey(name: "specialToDate")
  String? specialToDate;
  @JsonKey(name: "qty")
  int? qty;
  @JsonKey(name: "isInStock")
  bool? isInStock;
  @JsonKey(name: "visibility")
  String? visibility;
  @JsonKey(name: "taxClassId")
  String? taxClassId;
  @JsonKey(name: "productHasWeight")
  int? productHasWeight;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "isFeaturedProduct")
  String? isFeaturedProduct;
  @JsonKey(name: "weight")
  dynamic? weight;
  @JsonKey(name: "metaTitle")
  String? metaTitle;
  @JsonKey(name: "metaKeyword")
  String? metaKeyword;
  @JsonKey(name: "metaDescription")
  String? metaDescription;
  @JsonKey(name: "mpProductCartLimit")
  String? mpProductCartLimit;
  @JsonKey(name: "baseImage")
  String? baseImage;
  @JsonKey(name: "smallImage")
  String? smallImage;
  @JsonKey(name: "swatchImage")
  String? swatchImage;
  @JsonKey(name: "thumbnail")
  String? thumbnail;
  @JsonKey(name: "mediaGallery")
  List<MediaGallery>? mediaGallery;
  @JsonKey(name: "related")
  List<String>? related;
  @JsonKey(name: "upsell")
  List<String>? upsell;
  @JsonKey(name: "crossSell")
  List<String>? crossSell;
  @JsonKey(name:"samplesData")
  List<SamplesDataList>? samplesData;
  @JsonKey(name: "linkData")
  List<LinkData>? linkData;


  ProductData(
      {this.type,
        this.websiteIds,
        this.attributeSetId,
        this.categoryIds,
        this.name,
        this.description,
        this.shortDescription,
        this.sku,
        this.price,
        this.specialPrice,
        this.specialFromDate,
        this.specialToDate,
        this.qty,
        this.isInStock,
        this.visibility,
        this.taxClassId,
        this.productHasWeight,
        this.status,
        this.isFeaturedProduct,
        this.weight,
        this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.mpProductCartLimit,
        this.baseImage,
        this.smallImage,
        this.swatchImage,
        this.thumbnail,
        this.mediaGallery,
        this.related,
        this.upsell,
        this.crossSell,
        this.samplesData,
        this.linkData
      });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
