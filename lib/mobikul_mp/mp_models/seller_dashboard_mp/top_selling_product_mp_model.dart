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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/configure_data_mp_model.dart';
part 'top_selling_product_mp_model.g.dart';

@JsonSerializable()
class TopSellingProductMpModel {
  int? reviewCount;
  // ConfigureDataMpModel? configurableData;
  bool? isInWishlist;
  int? wishlistItemId;
  String? typeId;
  int? entityId;
  String? rating;
  bool? isAvailable;
  String? price;
  String? finalPrice;
  String? formattedPrice;
  String? formattedFinalPrice;
  String? name;
  bool? hasRequiredOptions;
  bool? isNew;
  bool? isInRange;
  String? thumbNail;
  String? dominantColor;
  String? tierPrice;
  String? formattedTierPrice;
  int? minAddToCartQty;
  String? availability;
  String? arUrl;
  String? arType;
  List<dynamic>? arTextureImages;
  String? salesQty;

  TopSellingProductMpModel(
      {this.reviewCount,
      // this.configurableData,
      this.isInWishlist,
      this.wishlistItemId,
      this.typeId,
      this.entityId,
      this.rating,
      this.isAvailable,
      this.price,
      this.finalPrice,
      this.formattedPrice,
      this.formattedFinalPrice,
      this.name,
      this.hasRequiredOptions,
      this.isNew,
      this.isInRange,
      this.thumbNail,
      this.dominantColor,
      this.tierPrice,
      this.formattedTierPrice,
      this.minAddToCartQty,
      this.availability,
      this.arUrl,
      this.arType,
      this.arTextureImages,

      this.salesQty});

  factory TopSellingProductMpModel.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopSellingProductMpModelToJson(this);
}
