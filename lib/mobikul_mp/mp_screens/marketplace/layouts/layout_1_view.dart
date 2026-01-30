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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/catalog/widget/catalog_listview.dart';
import 'package:test_new/mobikul/screens/catalog/widget/item_catalog_product_list.dart';
import 'package:test_new/mobikul/screens/product_detail/widgets/product_webview.dart';
import 'package:test_new/mobikul/screens/product_detail/widgets/rating_container.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/widgets/marketplace_layout_one_widgets/product_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../mobikul/app_widgets/app_outlined_button.dart';
import '../../../../mobikul/helper/app_storage_pref.dart';
import '../../../mp_models/marketplace/marketplace_layout_one/seller_info_model.dart';

class LayoutOneView extends StatefulWidget {
  final MarketplaceLandingPageModel marketplaceLandingPageModel;
  const LayoutOneView({Key? key, required this.marketplaceLandingPageModel})
      : super(key: key);

  @override
  State<LayoutOneView> createState() => _LayoutOneViewState();
}

class _LayoutOneViewState extends State<LayoutOneView> {
  ScrollController _controller = ScrollController();
  WebViewController? _webViewController;

  @override
  void initState() {
    // TODO: implement initState
    // _controller.animateTo(
    //   _controller.position.maxScrollExtent,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.easeInOut,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.marketPlace),
          context),
      body: SingleChildScrollView(
          // controller: _controller,
          child: Column(children: [
        /// BannerView
        if (widget.marketplaceLandingPageModel.layout1?.displayBanner == true)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: AppSizes.deviceWidth / 1,
                height: AppSizes.deviceWidth / 2,
                child: ImageView(
                  url: widget.marketplaceLandingPageModel.layout1?.bannerImage,
                  fit: BoxFit.fill,
                  isBottomPadding: false,
                ),
              ),
              Container(
                width: AppSizes.deviceWidth / 1,
                height: AppSizes.deviceWidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.4),
                    ])),
              ),
              Center(
                child: SizedBox(
                  width: AppSizes.deviceWidth / 1,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.marketplaceLandingPageModel.layout1
                                  ?.buttonHeadingLabel ??
                              '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          Utils.parseHtmlString(widget.marketplaceLandingPageModel.layout1
                              ?.bannerContent ??
                              ''),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: AppSizes.genericButtonHeight - 5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
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
                                  if (appStoragePref.isLoggedIn()) {
                                    if (appStoragePref.isSeller() && !appStoragePref.isPendingSeller()) {
                                      Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                                    } else {
                                      Navigator.pushNamed(context, AppRoutes.becomeSeller);
                                    }
                                  } else {
                                    Navigator.of(context).pushNamed(AppRoutes.signInSignUp, arguments: true);
                                  }
                                },
                                child: Center(
                                    child: Text(
                                        widget.marketplaceLandingPageModel
                                                .layout1?.buttonHeadingLabel
                                                ?.toUpperCase() ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.black)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ///optionsView
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                widget.marketplaceLandingPageModel.layout1?.firstLabel ?? '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: TextDecoration.underline),
              ),
            ),
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
                    widget.marketplaceLandingPageModel.layout1?.iconOne ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout1?.iconOne ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout1?.labelOne ?? '',
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
                    widget.marketplaceLandingPageModel.layout1?.iconTwo ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout1?.iconTwo ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout1?.labelTwo ?? '',
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
                    widget.marketplaceLandingPageModel.layout1?.iconThree ??
                        ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout1?.iconThree ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout1?.labelThree ?? '',
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
                    widget.marketplaceLandingPageModel.layout1?.iconFour ?? ''),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color?.withOpacity(0.3),
                    backgroundImage: NetworkImage(
                        widget.marketplaceLandingPageModel.layout1?.iconFour ??
                            ''),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                widget.marketplaceLandingPageModel.layout1?.labelFour ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ]),
          ]),
        ),

        ///sellerWithTasteView
        Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                Utils.getStringValue(
                    context, MpStringConstants.sellersWithTaste),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ListView.builder(
                itemCount: widget
                    .marketplaceLandingPageModel.layout1?.sellersData?.length ?? 0,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return
                      //   SizedBox(
                      //   height: MediaQuery.of(context).size.height / 2,
                      //   width: MediaQuery.of(context).size.width / 1,
                      //   child: CatalogListView(
                      //     products: widget.marketplaceLandingPageModel?.layout1
                      //         ?.sellersData?[index].products,
                      //     controller: _controller,
                      //     direction: Axis.horizontal,
                      //   ),
                      // );

                      //   ItemCatalogProductList(
                      //   product: widget.marketplaceLandingPageModel?.layout1
                      //       ?.sellersData[index],
                      //   isSelected: false,
                      // );
                      // CatalogListView(
                      //   products: widget.marketplaceLandingPageModel?.layout1
                      //       ?.sellersData?[index].products);

                      ProductView(
                    index: index,
                    marketplaceLandingPageModel:
                        widget.marketplaceLandingPageModel,
                  );
                }),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                widget.marketplaceLandingPageModel.layout1?.thirdLabel ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.7,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.viewAllSellers);
                  },
                  child: Center(
                      child: Text(
                    Utils.getStringValue(
                        context, MpStringConstants.viewAllSellers),
                  ))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                widget.marketplaceLandingPageModel.layout1?.fourthLabel ?? '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: HtmlWidget(widget.marketplaceLandingPageModel.layout1?.aboutContent??""),
            ),
            // Html(data: Utils.loadWebViewData(widget.marketplaceLandingPageModel.layout1?.aboutContent??"") ?? ''),

            SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child:  appOutlinedButton(
                  context,
                      () {
                    Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                  },
                  Utils.getStringValue(
                      context, MpStringConstants.openAMarketPlaceShop),
                  height: 45,
                  width: AppSizes.deviceWidth / 1.5,
                )
            ),
            SizedBox(height: AppSizes.paddingNormal,)
          ],
        )
      ])),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
