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
part 'products_model.g.dart';

@JsonSerializable()
class Products {
  int? reviewCount;
  // ConfigurableData? configurableData;
  bool? isInWishlist;
  int? wishlistItemId;
  String? typeId;
  String? entityId;
  int? rating;
  bool? isAvailable;
  String? price;
  String? finalPrice;
  String? formattedPrice;
  String? formattedFinalPrice;
  String? name;
  bool? hasRequiredOptions = false;
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
  // List<String>? arTextureImages;
  // String? linksPurchasedSeparately;

  Products({
    this.reviewCount,
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
    // this.arTextureImages,
    // this.linksPurchasedSeparately
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  bool hasSpecialPrice() {
    return double.parse(finalPrice.toString()) != 0.0 &&
        double.parse(finalPrice.toString()) < double.parse(price.toString()) &&
        (isInRange ?? true);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
