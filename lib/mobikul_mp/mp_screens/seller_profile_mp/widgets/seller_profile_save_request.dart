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

class SellerProfileSaveRequestModel {
  final String? storeId;
  final String? customerToken;
  final bool? twActive;
  final String? twitterId;
  final bool? fbActive;
  final String? facebookId;
  final bool? instagramActive;
  final String? instagramId;
  final bool? gplusActive;
  final String? gplusId;
  final bool? youtubeActive;
  final String? youtubeId;
  final bool? vimeoActive;
  final String? vimeoId;
  final bool? pinterestActive;
  final String? pinterestId;
  final String? contactNumber;
  final String? taxvat;
  final String? backgroundColor;
  final String? shopTitle;
  final String? companyLocality;
  final String? companyDescription;
  final String? returnPolicy;
  final String? shippingPolicy;
  final String? privacyPolicy;
  final String? country;
  final String? metaKeyword;
  final String? metaDescription;
  final String? paymentDetails;
  final String? profileLogo;
  final String? banner;

  SellerProfileSaveRequestModel({
    required this.storeId,
    required this.customerToken,
    required this.twActive,
    required this.twitterId,
    required this.fbActive,
    required this.facebookId,
    required this.instagramActive,
    required this.instagramId,
    required this.gplusActive,
    required this.gplusId,
    required this.backgroundColor,
    required this.companyLocality,
    required this.companyDescription,
    required this.pinterestId,
    required this.country,
    required this.shopTitle,
    required this.vimeoId,
    required this.youtubeId,
    required this.privacyPolicy,
    required this.shippingPolicy,
    required this.returnPolicy,
    required this.paymentDetails,
    required this.metaKeyword,
    required this.metaDescription,
    required this.contactNumber,
    required this.taxvat,
    required this.banner,
    required this.pinterestActive,
    required this.profileLogo,
    required this.vimeoActive,
    required this.youtubeActive,
  });

  Map<String, dynamic> toJson() {
    return {
      'storeId': storeId,
      'customerToken': customerToken,
      'twActive': twActive,
      'twitterId': twitterId,
      'fbActive': fbActive,
      'facebookId': facebookId,
      'instagramActive': instagramActive,
      'instagramId': instagramId,
      'gplusActive': gplusActive,
      'gplusId': gplusId,
      'backgroundColor': backgroundColor,
      'companyLocality': companyLocality,
      'companyDescription': companyDescription,
      'pinterestId': pinterestId,
      'country': country,
      'shopTitle': shopTitle,
      'vimeoId': vimeoId,
      'youtubeId': youtubeId,
      'privacyPolicy': privacyPolicy,
      'shippingPolicy': shippingPolicy,
      'returnPolicy': returnPolicy,
      'paymentDetails': paymentDetails,
      'metaKeyword': metaKeyword,
      'metaDescription': metaDescription,
      'contactNumber': contactNumber,
      'taxvat': taxvat,
      'banner': banner,
      'pinterestActive': pinterestActive,
      'profileLogo': profileLogo,
      'vimeoActive': vimeoActive,
      'youtubeActive': youtubeActive,
    };
  }
}
