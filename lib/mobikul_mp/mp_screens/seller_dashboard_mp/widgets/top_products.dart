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
import 'package:test_new/mobikul/app_widgets/common_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

class TopProducts extends StatelessWidget {
  final SellerDashboardMpModel? sellerDashboardMpModel;
  const TopProducts(
    this.sellerDashboardMpModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).cardColor,
        child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(
                Utils.getStringValue(context, MpStringConstants.top5Products)
                        .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [
              ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:
                      sellerDashboardMpModel?.topSellingProducts?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Center(
                              child: SizedBox(
                                height: AppSizes.deviceWidth / 4,
                                width: AppSizes.deviceWidth / 4,
                                child: ImageView(
                                  fit: BoxFit.fill,
                                  url: sellerDashboardMpModel
                                      ?.topSellingProducts?[index].thumbNail,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sellerDashboardMpModel
                                          ?.topSellingProducts?[index].name ??
                                      '',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${Utils.getStringValue(context, MpStringConstants.totalSalesQty)} - ',
                                      style:
                                          Theme.of(context).textTheme.titleMedium,
                                    ),
                                    Text(
                                      sellerDashboardMpModel
                                              ?.topSellingProducts?[index]
                                              .salesQty ??
                                          '',
                                      style:
                                          Theme.of(context).textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ]),
      ),
    );
  }
}
