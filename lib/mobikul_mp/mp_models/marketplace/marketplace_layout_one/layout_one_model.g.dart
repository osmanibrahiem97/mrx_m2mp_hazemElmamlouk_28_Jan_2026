// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_one_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Layout1 _$Layout1FromJson(Map<String, dynamic> json) => Layout1(
      displayBanner: json['displayBanner'] as bool?,
      bannerContent: json['bannerContent'] as String?,
      buttonHeadingLabel: json['buttonHeadingLabel'] as String?,
      bannerImage: json['bannerImage'] as String?,
      firstLabel: json['firstLabel'] as String?,
      displayIcon: json['displayIcon'] as bool?,
      iconOne: json['iconOne'] as String?,
      labelOne: json['labelOne'] as String?,
      iconTwo: json['iconTwo'] as String?,
      labelTwo: json['labelTwo'] as String?,
      iconThree: json['iconThree'] as String?,
      labelThree: json['labelThree'] as String?,
      iconFour: json['iconFour'] as String?,
      labelFour: json['labelFour'] as String?,
      showSellers: json['showSellers'] as bool?,
      secondLabel: json['secondLabel'] as String?,
      sellersData: (json['sellersData'] as List<dynamic>?)
          ?.map((e) => SellersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      thirdLabel: json['thirdLabel'] as String?,
      fourthLabel: json['fourthLabel'] as String?,
      aboutContent: json['aboutContent'] as String?,
      sellerInfo: json['sellerInfo'] == null
          ? null
          : SellerInfoModel.fromJson(
              json['sellerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Layout1ToJson(Layout1 instance) => <String, dynamic>{
      'displayBanner': instance.displayBanner,
      'bannerContent': instance.bannerContent,
      'buttonHeadingLabel': instance.buttonHeadingLabel,
      'bannerImage': instance.bannerImage,
      'firstLabel': instance.firstLabel,
      'displayIcon': instance.displayIcon,
      'iconOne': instance.iconOne,
      'labelOne': instance.labelOne,
      'iconTwo': instance.iconTwo,
      'labelTwo': instance.labelTwo,
      'iconThree': instance.iconThree,
      'labelThree': instance.labelThree,
      'iconFour': instance.iconFour,
      'labelFour': instance.labelFour,
      'showSellers': instance.showSellers,
      'secondLabel': instance.secondLabel,
      'sellersData': instance.sellersData,
      'thirdLabel': instance.thirdLabel,
      'fourthLabel': instance.fourthLabel,
      'aboutContent': instance.aboutContent,
      'sellerInfo': instance.sellerInfo,
    };
