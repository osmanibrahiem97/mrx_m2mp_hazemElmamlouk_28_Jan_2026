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
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../../mobikul/models/order_details/order_detail_model.dart';
import '../../../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';

Widget SellerOrderRefundIdContainer(
    BuildContext context,
    SellerOrderDetailsMpModel? sellerOrderDetailsMpModel,
    AppLocalizations? localization) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.paddingMedium),
          topRight: Radius.circular(AppSizes.paddingMedium)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.size8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSizes.paddingMedium,
          ),
          Text(
            '${localization?.translate(MpStringConstants.orderId)} #${sellerOrderDetailsMpModel?.incrementId}',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                // color: AppColors.textColorSecondary,
                fontSize: AppSizes.textSizeMedium),
          ),
          const SizedBox(
            height: AppSizes.paddingMedium,
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    ]),
  );
}

Widget SellerOrderRefundPlaceDateContainer(
    BuildContext context,
    SellerOrderDetailsMpModel? sellerOrderDetailsMpModel,
    AppLocalizations? localization) {
  return Container(
      color: Theme.of(context).cardColor,
      width: AppSizes.deviceWidth,
      padding: const EdgeInsets.symmetric(
          vertical: AppSizes.paddingMedium, horizontal: AppSizes.size8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization?.translate(MpStringConstants.placedOn) ?? "",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorSecondary,
                    fontSize: AppSizes.textSizeSmall),
              ),
              const SizedBox(
                height: AppSizes.linePadding,
              ),
              Text(
                sellerOrderDetailsMpModel?.orderDate ?? "",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    // color: AppColors.textColorPrimary,
                    fontSize: AppSizes.textSizeMedium),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacingGeneric,
                vertical: AppSizes.spacingTiny),
            decoration: BoxDecoration(
                color: Utils.orderStatusBackground(
                    sellerOrderDetailsMpModel!.state.toString(),
                    "" /*orderModel.statusColorCode.toString()*/),
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              sellerOrderDetailsMpModel.state?.toUpperCase() ?? "",
              style: const TextStyle(
                  color: AppColors.white, fontSize: AppSizes.textSizeSmall),
            ),
          ),
        ],
      ));
}
