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

import 'package:test_new/mobikul/models/categoryPage/product_tile_data.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/products_model.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/recent_product_list_mp_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/report_data_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/review_list_mp_model.dart';

part 'store_profile_mp_model.g.dart';

@JsonSerializable()
class StoreProfileMpModel extends BaseModel {
  String? bannerImage;
  String? profileImage;
  String? backgroundColor;
  String? shopUrl;
  String? sellerId;
  String? location;
  String? shopTitle;
  bool? isTwitterActive;
  String? twitterId;
  bool? isFacebookActive;
  String? facebookId;
  bool? isInstagramActive;
  String? instagramId;
  bool? isgoogleplusActive;
  String? googleplusId;
  bool? isYoutubeActive;
  String? youtubeId;
  bool? isVimeoActive;
  String? vimeoId;
  bool? isPinterestActive;
  int? orderCount;
  String? pinterestId;
  String? description;
  int? productCount;
  String? returnPolicy;
  double? averageRating;
  String? shippingPolicy;
  String? privacyPolicy;
  List<ProductTileData>? recentProductList;
  String? feedbackCount;
  String? price5Star;
  String? price4Star;
  String? price3Star;
  String? price2Star;
  String? price1Star;
  double? averagePriceRating;
  String? value5Star;
  String? value4Star;
  String? value3Star;
  String? value2Star;
  String? value1Star;
  double? averageValueRating;
  String? quality5Star;
  String? quality4Star;
  String? quality3Star;
  String? quality2Star;
  String? quality1Star;
  double? averageQualityRating;
  List<ReviewListMpModel>? reviewList;
  bool? showReview;
  ReportDataMpModel? reportData;
  @JsonKey(name:"is_seller_policies_enabled")
  bool? isSellerPoliciesEnabled;

  StoreProfileMpModel(
      {this.bannerImage,
      this.profileImage,
      this.backgroundColor,
      this.shopUrl,
      this.sellerId,
      this.location,
      this.shopTitle,
      this.isTwitterActive,
      this.twitterId,
      this.isFacebookActive,
      this.facebookId,
      this.isInstagramActive,
      this.instagramId,
      this.isgoogleplusActive,
      this.googleplusId,
      this.isYoutubeActive,
      this.youtubeId,
      this.vimeoId,
      this.isPinterestActive,
      this.orderCount,
      this.pinterestId,
      this.description,
      this.productCount,
      this.returnPolicy,
      this.averageRating,
      this.shippingPolicy,
      this.privacyPolicy,
      this.recentProductList,
      this.feedbackCount,
      this.price5Star,
      this.price4Star,
      this.price3Star,
      this.price2Star,
      this.price1Star,
      this.averagePriceRating,
      this.value5Star,
      this.value4Star,
      this.value3Star,
      this.value2Star,
      this.value1Star,
      this.averageValueRating,
      this.quality5Star,
      this.quality4Star,
      this.quality3Star,
      this.quality2Star,
      this.quality1Star,
      this.averageQualityRating,
      this.reviewList,
      this.showReview,
      this.reportData,
        this.isVimeoActive,
        this.isSellerPoliciesEnabled
      });

  factory StoreProfileMpModel.fromJson(Map<String, dynamic> json) =>
      _$StoreProfileMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreProfileMpModelToJson(this);
}
