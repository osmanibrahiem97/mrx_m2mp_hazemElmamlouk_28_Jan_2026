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

import 'package:flutter/material.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/configuration/mobikul_theme.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_images.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/widgets/marketplace_layout_two_widgets/static_view_listtile.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_storage_pref.dart';

class LayoutTwoView extends StatefulWidget {
  final MarketplaceLandingPageModel marketplaceLandingPageModel;

  const LayoutTwoView({super.key, required this.marketplaceLandingPageModel});
  @override
  State<LayoutTwoView> createState() => _LayoutTwoViewState();
}

class _LayoutTwoViewState extends State<LayoutTwoView> {
  ///Used for static view ( Don't Delete )
  var staticImageView = [
    MpStaticImages.landing1,
    MpStaticImages.landing2,
    MpStaticImages.landing3,
    MpStaticImages.landing4,
    MpStaticImages.landing5,
    MpStaticImages.landing6,
    MpStaticImages.landing7,
    MpStaticImages.landing8,
    MpStaticImages.landing8,
    MpStaticImages.landing8,
  ];
  var staticTitleView = [
    MpStringConstants.hugeBuyers,
    MpStringConstants.gotStuckAskQn,
    MpStringConstants.quickPayment,
    MpStringConstants.manageYourOrders,
    MpStringConstants.earnBadges,
    MpStringConstants.getYourselfVerified,
    MpStringConstants.customizeProfile,
    MpStringConstants.createYourOwnCollection,
    MpStringConstants.addMedia,
    MpStringConstants.addUnlimitedProducts,
  ];
  var staticSubTitleView = [
    MpStringConstants.hugeBuyersDetail,
    MpStringConstants.gotStuckAskQnDetail,
    MpStringConstants.quickPaymentDetail,
    MpStringConstants.manageYourOrdersDetail,
    MpStringConstants.earnBadgesDetail,
    MpStringConstants.getYourselfVerifiedDetail,
    MpStringConstants.customizeProfileDetail,
    MpStringConstants.createYourOwnCollectionDetail,
    MpStringConstants.addMediaDetail,
    MpStringConstants.addUnlimitedProductsDetail,
  ];

  ///Used for setup and customize view ( Don't Delete )
  var staticOptionsView = [
    MpStringConstants.setupAndCustomizeHeading1,
    MpStringConstants.setupAndCustomizeHeading2,
    MpStringConstants.setupAndCustomizeHeading3,
    MpStringConstants.setupAndCustomizeHeading4,
    MpStringConstants.setupAndCustomizeHeading5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        Utils.getStringValue(context, MpStringConstants.marketPlace),
        context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///BannerView
            if (widget.marketplaceLandingPageModel.layout2?.displayBanner ==
                true)
              _bannerView(),

            const SizedBox(height: 15.0),

            ///StaticView
            _staticCardsView(),

            const SizedBox(height: 15.0),

            ///ReallyEasyToSetupAndCustomizeView
            _setupAndCustomizeView(),

            const SizedBox(height: 15.0),
            _bottomCardView(),
          ],
        ),
      ),
    );
  }

  _bannerView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: AppSizes.deviceWidth / 1,
          height: AppSizes.deviceWidth / 2,
          child: ImageView(
            url: widget.marketplaceLandingPageModel.layout2?.bannerImage,
            fit: BoxFit.fill,
            isBottomPadding: false,
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        Container(
          width: AppSizes.deviceWidth / 1,
          height: AppSizes.deviceWidth / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.5),
              ])),
          child: Center(
            child: SizedBox(
              width: AppSizes.deviceWidth / 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          Utils.parseHtmlString(
                            widget.marketplaceLandingPageModel.layout2
                                    ?.bannerContent ??
                                '',
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (appStoragePref.isLoggedIn() && appStoragePref.isSeller() && !appStoragePref.isPendingSeller()) {
                          Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                        } else {
                          Navigator.pushNamed(context, AppRoutes.becomeSeller);
                        }
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          widget.marketplaceLandingPageModel.layout2
                                  ?.buttonLabel
                                  ?.toUpperCase() ?? Utils.getStringValue(context, MpStringConstants.openYourShop),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _staticCardsView() {
    return ListView.builder(
        itemCount: staticSubTitleView.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return StaticViewListTile(
              context: context,
              title: Utils.getStringValue(
                context,
                staticTitleView[index],
              ),
              subTitle: Utils.getStringValue(
                context,
                staticSubTitleView[index],
              ),
              img: staticImageView[index]);
        });
  }

  _setupAndCustomizeView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
            child: Text(
              Utils.getStringValue(
                      context, MpStringConstants.setupAndCustomizeHeading)
                  .toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListView.builder(
              itemCount: staticOptionsView.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          color: MobikulTheme.diffColor,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            Utils.getStringValue(
                                context, staticOptionsView[index]),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 14.0),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  _bottomCardView() {
    return Container(
      color: Theme.of(context).iconTheme.color,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                Utils.getStringValue(context, MpStringConstants.lastComment),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).cardColor, height: 1.3),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: AppSizes.genericButtonHeight - 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (appStoragePref.isLoggedIn() && appStoragePref.isSeller() && !appStoragePref.isPendingSeller()) {
                        Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                      } else {
                        Navigator.pushNamed(context, AppRoutes.becomeSeller);
                      }
                    },
                    child: Center(
                        child: Text(
                            widget.marketplaceLandingPageModel.layout2
                                    ?.buttonLabel
                                    ?.toUpperCase() ??
                                Utils.getStringValue(context, MpStringConstants.openYourShop),
                            style: const TextStyle(color: Colors.black)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
