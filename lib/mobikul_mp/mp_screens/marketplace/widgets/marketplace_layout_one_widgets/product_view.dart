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
import 'package:test_new/mobikul/app_widgets/badge_icon.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/catalog/widget/catalog_listview.dart';
import 'package:test_new/mobikul/screens/catalog/widget/item_catalog_product_grid.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';

import '../../../../../main.dart';
import '../../../../mp_constants/mp_arguments_map.dart';

class ProductView extends StatefulWidget {
  final MarketplaceLandingPageModel marketplaceLandingPageModel;
  final index;
  const ProductView(
      {Key? key,
      required this.marketplaceLandingPageModel,
      required this.index})
      : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.storeProfile,
                      arguments: getStoreProfileAttributeMap(
                        widget.marketplaceLandingPageModel?.layout1
                            ?.sellersData?[widget.index].sellerId??0,
                        false,
                      ),
                    );
                    },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            Theme.of(context).iconTheme.color?.withOpacity(0.3),
                        backgroundImage: NetworkImage(widget
                                .marketplaceLandingPageModel
                                ?.layout1
                                ?.sellersData?[widget.index]
                                .logo ??
                            ''),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.marketplaceLandingPageModel?.layout1
                                    ?.sellersData?[widget.index].shopTitle ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.marketplaceLandingPageModel?.layout1
                                    ?.sellersData?[widget.index].productCount ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            navigatorKey.currentContext!, AppRoutes.catalogMp,
                            arguments: getCatalogMap(
                              widget.marketplaceLandingPageModel?.layout1
                                      ?.sellersData?[widget.index].sellerId
                                      .toString() ??
                                  "",
                              Utils.parseHtmlString(widget
                                      .marketplaceLandingPageModel
                                      ?.layout1
                                      ?.sellersData?[widget.index]
                                      .shopTitle ??
                                  ""),
                              "",
                              false,
                            ));
                      },
                      child: Center(
                        child: Text(
                          Utils.getStringValue(
                              context, MpStringConstants.viewAll),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            ///ListView
            if ((widget.marketplaceLandingPageModel.layout1?.sellersData?[widget.index].products??[]).isNotEmpty)
              SizedBox(
                height:(AppSizes.deviceWidth <= AppSizes.maxDeviceWidth) ? AppSizes.calculatedListHeight : AppSizes.calculatedMediumDeviceGridHeight,
                // height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1,
                child: ListView.builder(
                  itemCount: widget.marketplaceLandingPageModel.layout1
                      ?.sellersData?[widget.index].products?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.productPage,
                          arguments: getProductDataAttributeMap(
                            widget
                                .marketplaceLandingPageModel
                                .layout1
                                ?.sellersData?[widget.index]
                                .products?[index]
                                .name ??
                                "",
                            widget
                                .marketplaceLandingPageModel
                                .layout1
                                ?.sellersData?[widget.index]
                                .products?[index]
                                .entityId
                                .toString() ??
                                "",
                          ),
                        );
                      },
                      child: ItemCatalogProductGrid(
                        product: widget.marketplaceLandingPageModel?.layout1
                            ?.sellersData?[widget.index].products?[index],
                        imageSize: AppSizes.calculatedGridWidth,

                        // imageSize: (AppSizes.deviceWidth -
                        //     (AppSizes.size8 + AppSizes.size8)) /
                        //     3,
                        isSelected: false,
                      ),

                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 3.4,
                      //   width: MediaQuery.of(context).size.width / 2.6,
                      //   child:
                      //   Card(
                      //     color: Theme.of(context).cardColor,
                      //     elevation: 3,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         Center(
                      //           child: SizedBox(
                      //             height: AppSizes.deviceWidth / 3,
                      //             child: ImageView(
                      //               fit: BoxFit.fill,
                      //               url: widget
                      //                       .marketplaceLandingPageModel
                      //                       .layout1
                      //                       ?.sellersData?[widget.index]
                      //                       .products?[index]
                      //                       .thumbNail ??
                      //                   '',
                      //               borderRadius: const BorderRadius.only(
                      //                   topLeft: Radius.circular(8),
                      //                   topRight: Radius.circular(8)),
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: AppSizes.spacingGeneric,
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //             horizontal: AppSizes.spacingGeneric,
                      //           ),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             mainAxisSize: MainAxisSize.max,
                      //             children: <Widget>[
                      //               Text(
                      //                 widget
                      //                         .marketplaceLandingPageModel
                      //                         .layout1
                      //                         ?.sellersData?[widget.index]
                      //                         .products?[index]
                      //                         .formattedFinalPrice ??
                      //                     '',
                      //                 style:
                      //                     Theme.of(context).textTheme.bodyText1,
                      //               ),
                      //               const Spacer(),
                      //               InkWell(
                      //                   onTap: () {
                      //                     // Navigator.of(context).pushNamed(AppRoutes.wishlistComment);
                      //                   },
                      //                   child: BadgeIcon(
                      //                     icon: const Icon(
                      //                       Icons.favorite_outline,
                      //                       size: 15,
                      //                     ),
                      //                   ))
                      //             ],
                      //           ),
                      //         ),
                      //         Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: AppSizes.spacingGeneric,
                      //                 vertical: AppSizes.linePadding),
                      //             child: Text(
                      //               widget
                      //                       .marketplaceLandingPageModel
                      //                       .layout1
                      //                       ?.sellersData?[widget.index]
                      //                       .products?[index]
                      //                       .name ??
                      //                   '',
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .subtitle2
                      //                   ?.copyWith(
                      //                       fontSize: AppSizes.textSizeSmall),
                      //               overflow: TextOverflow.ellipsis,
                      //               maxLines: 2,
                      //             )),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
