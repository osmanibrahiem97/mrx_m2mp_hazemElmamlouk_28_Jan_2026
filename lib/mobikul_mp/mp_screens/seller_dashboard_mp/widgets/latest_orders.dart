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
import 'package:intl/intl.dart';
import 'package:test_new/mobikul/app_widgets/common_outlined_button.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/downloadable_products/views/download_product_item.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

import '../../../mp_constants/mp_arguments_map.dart';

class LatestOrders extends StatelessWidget {
  final SellerDashboardMpModel? sellerDashboardMpModel;
  const LatestOrders(
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
                Utils.getStringValue(context, MpStringConstants.latestOrders)
                        .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [
              ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:
                      sellerDashboardMpModel?.recentOrderList?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AppRoutes.sellerOrderDetails,
                            arguments: getSellerOrderDetail(sellerDashboardMpModel!.recentOrderList![index].incrementId.toString() ?? "",sellerDashboardMpModel!.recentOrderList![index].orderId.toString() ?? "")
                        );
                      },
                      child: Container(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.size8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "#${sellerDashboardMpModel!.recentOrderList![index]?.incrementId.toString() ?? " "}",
                                          // style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: AppSizes.textSizeLarge, color: AppColors.textColorPrimary),
                                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                            // color: AppColors.textColorPrimary,
                                              fontSize: AppSizes.textSizeLarge),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.size14,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSizes.spacingGeneric,
                                      vertical: AppSizes.spacingTiny),
                                  decoration: BoxDecoration(
                                      color: Utils.orderStatusBackground(sellerDashboardMpModel!.recentOrderList![index]!.status.toString(),
                                          sellerDashboardMpModel!.recentOrderList![index].statusColorCode.toString()),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    sellerDashboardMpModel!.recentOrderList![index].status?.toUpperCase() ?? "",
                                    style: const TextStyle(
                                        color: AppColors.white, fontSize: AppSizes.textSizeSmall),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSizes.size14,
                                ),
                                Text(
                                  '${sellerDashboardMpModel!.recentOrderList![index]?.customerDetails!.name}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    // color: AppColors.textColorPrimary,
                                      fontSize: AppSizes.textSizeMedium),
                                ),
                                const SizedBox(
                                  height: AppSizes.size8,
                                ),
                                Text(
                                  '${sellerDashboardMpModel!.recentOrderList![index]?.customerDetails!.date}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    // color: AppColors.textColorPrimary,
                                      fontSize: AppSizes.textSizeMedium),
                                ),
                                const SizedBox(
                                  height: AppSizes.size8,
                                ),
                                Text(
                                  '${Utils.getStringValue(context, MpStringConstants.orderTotalBase) ?? ''} ${sellerDashboardMpModel!.recentOrderList![index]?.customerDetails!.baseTotal}',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    // color: AppColors.textColorPrimary,
                                      fontSize: AppSizes.textSizeMedium),
                                ),
                                const SizedBox(
                                  height: AppSizes.size8,
                                ),
                                Text(
                                  '${Utils.getStringValue(context, MpStringConstants.orderTotalPurchased) ?? ''} ${sellerDashboardMpModel!.recentOrderList![index]?.customerDetails!.purchaseTotal}',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    // color: AppColors.textColorPrimary,
                                      fontSize: AppSizes.textSizeMedium),
                                ),
                                const SizedBox(
                                  height: AppSizes.size8,
                                ),
                              ]),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.sellerOrderDetails,
                                        arguments: getSellerOrderDetail(sellerDashboardMpModel!.recentOrderList![index].incrementId.toString() ?? "",sellerDashboardMpModel!.recentOrderList![index].orderId.toString() ?? "")
                                    );
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_right))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppSizes.genericButtonHeight - 5,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.sellerOrders);
                      },
                      child: Center(
                        child: Text(
                          Utils.getStringValue(
                              context, MpStringConstants.viewAllOrders),
                          style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color),
                        ),
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
