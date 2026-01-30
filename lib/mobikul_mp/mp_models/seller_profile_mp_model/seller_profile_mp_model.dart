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
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/country_list_mp_model.dart';

part 'seller_profile_mp_model.g.dart';

@JsonSerializable()
class SellerProfileMpModel extends BaseModel {
  bool? showProfileHint;
  bool? isTwitterActive;
  String? twitterId;
  String? twitterHint;
  bool? isFacebookActive;
  String? facebookId;
  String? facebookHint;
  bool? isInstagramActive;
  String? instagramId;
  bool? isgoogleplusActive;
  String? googleplusId;
  bool? isYoutubeActive;
  String? youtubeId;
  bool? isVimeoActive;
  String? vimeoId;
  bool? isPinterestActive;
  String? pinterestId;
  String? contactNumber;
  String? contactNumberHint;
  String? taxvat;
  String? taxvatHint;
  String? backgroundColor;
  String? backgroundColorHint;
  String? shopTitle;
  String? shopTitleHint;
  String? bannerHint;
  String? bannerImage;
  String? profileImageHint;
  String? profileImage;
  String? url;
  String? companyLocalityHint;
  String? companyLocality;
  String? companyDescriptionHint;
  String? companyDescription;
  String? returnPolicyHint;
  String? returnPolicy;
  String? shippingPolicyHint;
  String? shippingPolicy;
  String? privacyPolicy;
  String? countryHint;
  String? country;
  List<CountryListMpModel>? countryList;
  String? flagImageUrl;
  String? metaKeywordHint;
  String? metaKeyword;
  String? metaDescriptionHint;
  String? metaDescription;
  String? paymentDetailsHint;
  String? paymentDetails;
  bool? isColorPickerEnabled;
  bool? isSellerPolicyEnabled;
  String? pickUpLatitude;
  String? pickUpLongitude;
  String? pickUpAddress;
  bool? isMPDeliveryBoyEnabled;

  SellerProfileMpModel(
      {this.showProfileHint,
      this.isTwitterActive,
      this.twitterId,
      this.twitterHint,
      this.isFacebookActive,
      this.facebookId,
      this.facebookHint,
      this.isInstagramActive,
      this.instagramId,
      this.isgoogleplusActive,
      this.googleplusId,
      this.isYoutubeActive,
      this.youtubeId,
      this.isVimeoActive,
      this.vimeoId,
      this.isPinterestActive,
      this.pinterestId,
      this.contactNumber,
      this.contactNumberHint,
      this.taxvat,
      this.taxvatHint,
      this.backgroundColor,
      this.backgroundColorHint,
      this.shopTitle,
      this.shopTitleHint,
      this.bannerHint,
      this.bannerImage,
      this.profileImageHint,
      this.profileImage,
      this.url,
      this.companyLocalityHint,
      this.companyLocality,
      this.companyDescriptionHint,
      this.companyDescription,
      this.returnPolicyHint,
      this.returnPolicy,
      this.shippingPolicyHint,
      this.shippingPolicy,
      this.privacyPolicy,
      this.countryHint,
      this.country,
      this.countryList,
      this.flagImageUrl,
      this.metaKeywordHint,
      this.metaKeyword,
      this.metaDescriptionHint,
      this.metaDescription,
      this.paymentDetailsHint,
      this.paymentDetails,
      this.isColorPickerEnabled,
      this.isSellerPolicyEnabled,
      this.pickUpLatitude,
      this.pickUpLongitude,
      this.pickUpAddress,
      this.isMPDeliveryBoyEnabled});

  CountryListMpModel? getCountryById(String? id) {
    for (var country in (countryList ?? <CountryListMpModel?>[])) {
      if (country?.value == id || country?.label == id) {
        return country;
      }
    }
    return countryList?.isNotEmpty == true ? countryList?.elementAt(0) : null;
  }

  factory SellerProfileMpModel.fromJson(Map<String, dynamic> json) =>
      _$SellerProfileMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerProfileMpModelToJson(this);
}
