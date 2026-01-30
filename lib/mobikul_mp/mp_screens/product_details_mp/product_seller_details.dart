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

// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';

import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/models/productDetail/product_flags.dart';
import '../../../mobikul/models/productDetail/report_data_model.dart';
import '../../../mobikul/screens/product_detail/widgets/rating_container.dart';
import '../../mp_constants/mp_arguments_map.dart';
import '../../mp_constants/mp_string_constants.dart';
import '../../mp_models/marketplace/marketplace_layout_one/seller_info_model.dart';

// import '../../../mobikul/constants/app_routes.dart';
// // import '../../../mobikul/models/productDetail/report_data_model.dart';
// import '../../../mobikul/screens/product_detail/widgets/rating_container.dart';
// import '../../mp_constants/mp_arguments_map.dart';
// import '../../mp_constants/mp_string_constants.dart';
// import '../../mp_models/marketplace/marketplace_layout_one/seller_info_model.dart';

class ProductSellerDetailsView extends StatefulWidget {
  SellerInfoModel? sellerInfo;
  ProductFlags? productFlags;
  int? productId;
  bool? isProductFlagsEnabled;
  String? placeHolderData;

  ProductSellerDetailsView(this.sellerInfo, this.productFlags, this.productId, this.isProductFlagsEnabled,this.placeHolderData, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductSellerDetailsViewState();
}

class _ProductSellerDetailsViewState extends State<ProductSellerDetailsView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ((widget.sellerInfo?.shoptitle??"").isNotEmpty) ? Container(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(top: AppSizes.size8),
      child: ExpansionTile(
        initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.soldBy) ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          children: [
            Container(
                padding: const EdgeInsets.all(AppSizes.size8),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.storeProfile,
                          arguments: getStoreProfileAttributeMap(
                            widget.sellerInfo?.sellerId??0,
                            false,
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Utils.parseHtmlString(widget.sellerInfo?.shoptitle ?? ''),
                              style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(
                            height: 10,
                          ),
                          if ((widget.sellerInfo?.sellerLocation??"").isNotEmpty)
                            Text(widget.sellerInfo?.sellerLocation ?? '',
                              style: Theme.of(context).textTheme.displaySmall),
                          if ((widget.sellerInfo?.sellerLocation??"").isNotEmpty)
                            const SizedBox(
                              height: 10,
                            ),
                          if ((widget.sellerInfo?.sellerAverageRating??"").isNotEmpty)
                            SizedBox(
                              width: 70,
                              height: 25,
                              child: RatingContainer(double.parse(widget.sellerInfo?.sellerAverageRating.toString()??"0.0") ??
                                  0.0),
                            ),
                          if ((widget.sellerInfo?.sellerAverageRating??"").isNotEmpty)
                            const SizedBox(
                              height: 5,
                            ),
                          Text(
                              widget.sellerInfo?.reviewDescription ??
                                  '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith()),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.pix_rounded),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                  '${widget.sellerInfo?.sellerProductCount.toString()} ${Utils.getStringValue(context, AppStringConstant.products)}' ??
                                      '',
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.writeToUs, arguments: widget.sellerInfo?.sellerId);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text('${Utils.getStringValue(context, MpStringConstants.contactSeller)}',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                 if(widget.isProductFlagsEnabled ?? false)...[
                   if(widget.productFlags?.guestCanFlag ?? false)...[
                     InkWell(
                       onTap: () {
                         Navigator.of(context)
                             .pushNamed(AppRoutes.reportProduct, arguments: {
                           "productId": widget.productId,
                           "model": widget.productFlags,
                           "otherFieldPlaceholder": widget.placeHolderData
                         });
                       },
                       child: Row(
                         children: [
                           const Icon(Icons.flag),
                           const SizedBox(
                             width: 5.0,
                           ),
                           Text('${Utils.getStringValue(context, widget.productFlags?.text ?? "")}',
                               style: Theme.of(context).textTheme.titleLarge),
                         ],
                       ),
                     ),
                   ] else if(appStoragePref.isLoggedIn())...[
                     InkWell(
                       onTap: () {
                         Navigator.of(context)
                             .pushNamed(AppRoutes.reportProduct, arguments: {
                           "productId": widget.productId,
                           "model": widget.productFlags,
                           "otherFieldPlaceholder": widget.placeHolderData
                         });
                       },
                       child: Row(
                         children: [
                           const Icon(Icons.flag),
                           const SizedBox(
                             width: 5.0,
                           ),
                           Text('${Utils.getStringValue(context, widget.productFlags?.text ?? "")}',
                               style: Theme.of(context).textTheme.titleLarge),
                         ],
                       ),
                     )
                   ]
                 ]
                  ],
                )
            ),
          ]),
    )
    : Container();
  }
}
