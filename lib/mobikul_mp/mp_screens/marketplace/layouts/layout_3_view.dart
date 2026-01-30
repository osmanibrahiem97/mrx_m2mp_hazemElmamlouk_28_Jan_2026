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
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_images.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/widgets/marketplace_layout_three_widgets/static_view_gridtile.dart';
import '../../../../mobikul/constants/app_constants.dart';

class LayoutThreeView extends StatefulWidget {
  final MarketplaceLandingPageModel marketplaceLandingPageModel;

  const LayoutThreeView({super.key, required this.marketplaceLandingPageModel});
  @override
  State<LayoutThreeView> createState() => _LayoutThreeViewState();
}

class _LayoutThreeViewState extends State<LayoutThreeView> {
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
            if (widget.marketplaceLandingPageModel.layout3?.displayBanner ==
                true)
              _bannerView(),

            const SizedBox(height: 15.0),

            ///optionsView
            _optionView(),

            const SizedBox(height: 15.0),

            ///StaticView
            _staticCardsView(),

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
            url: widget.marketplaceLandingPageModel.layout3?.bannerImage,
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
                            widget.marketplaceLandingPageModel.layout3
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _optionView() {
    return Column(
      children: [
        Center(
          child: Row(
            children: [
              Container(
                color: Theme.of(context).iconTheme.color,
                height: 50,
                width: 10,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                widget.marketplaceLandingPageModel.layout3?.headingOne ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 50),
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).iconTheme.color?.withOpacity(0.1),
                backgroundImage: NetworkImage(
                    widget.marketplaceLandingPageModel.layout3?.iconOne ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout3?.iconOne ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout3?.labelOne ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 50),
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).iconTheme.color?.withOpacity(0.1),
                backgroundImage: NetworkImage(
                    widget.marketplaceLandingPageModel.layout3?.iconTwo ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout3?.iconTwo ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout3?.labelTwo ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 50),
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).iconTheme.color?.withOpacity(0.1),
                backgroundImage: NetworkImage(
                    widget.marketplaceLandingPageModel.layout3?.iconThree ??
                        ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout3?.iconThree ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout3?.labelThree ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 50),
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).iconTheme.color?.withOpacity(0.1),
                backgroundImage: NetworkImage(
                    widget.marketplaceLandingPageModel.layout3?.iconFour ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout3?.iconFour ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout3?.labelFour ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 50),
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).iconTheme.color?.withOpacity(0.1),
                backgroundImage: NetworkImage(
                    widget.marketplaceLandingPageModel.layout3?.iconFive ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout3?.iconFive ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout3?.labelFive ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
          ]),
        ),
      ],
    );
  }

  _staticCardsView() {
    return Column(
      children: [
        Text(
          widget.marketplaceLandingPageModel.layout3?.headingTwo
                  ?.toUpperCase() ??
              '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: MobikulTheme.diffColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: (AppSizes.deviceWidth/1.6),
              // childAspectRatio: 0.9,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: staticSubTitleView.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return StaticViewGridTile(
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
            }),
      ],
    );
  }

  _bottomCardView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                widget.marketplaceLandingPageModel.layout3?.headingThree ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(height: 1.3),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              // height: AppSizes.genericButtonHeight - 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (appStoragePref.isLoggedIn() && appStoragePref.isSeller() && !appStoragePref.isPendingSeller()) {
                        Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                      } else {
                        Navigator.pushNamed(context, AppRoutes.becomeSeller);
                      }
                    },
                    child: Center(
                        child: Text(
                            Utils.getStringValue(
                                context, MpStringConstants.openYourShop),
                            textAlign: TextAlign.center,
                            style:  TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
