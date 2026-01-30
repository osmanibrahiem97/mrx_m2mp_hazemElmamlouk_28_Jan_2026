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

part 'recent_product_list_mp_model.g.dart';

@JsonSerializable()
class RecentProductListMpModel {
  int? reviewCount;
  // ConfigurableData? configurableData;
  bool? isInWishlist;
  int? wishlistItemId;
  String? typeId;
  String? entityId;
  int? rating;
  bool? isAvailable;
  int? price;
  int? finalPrice;
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
  // List<Null>? arTextureImages;

  RecentProductListMpModel(
      {this.reviewCount,
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
      this.arType});

  factory RecentProductListMpModel.fromJson(Map<String, dynamic> json) =>
      _$RecentProductListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentProductListMpModelToJson(this);
}
