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
import 'package:test_new/mobikul_mp/mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';


Widget SellerOrderCreditMemoIdContainer(BuildContext context, SellerOrdersCreditmemoMpModel? sellerOrdersCreditMemoMpModel, AppLocalizations? localization) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.paddingMedium),
          topRight: Radius.circular(AppSizes.paddingMedium)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.size8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSizes.paddingMedium,
        ),
        Text(
          '${sellerOrdersCreditMemoMpModel?.subHeading}',
          style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(
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
      ]
    ),

  );
}

Widget SellerOrderCreditMemoPlaceDateContainer(BuildContext context, SellerOrdersCreditmemoMpModel? sellerOrdersCreditmemoMpModel, AppLocalizations? localization) {
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
                localization?.translate(MpStringConstants.placedOn)??"",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(
                    // color: AppColors.textColorSecondary,
                    fontSize: AppSizes.textSizeSmall),
              ),
              const SizedBox(
                height: AppSizes.linePadding,
              ),
              Text(
                sellerOrdersCreditmemoMpModel?.orderDate ?? "",
                style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
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
                color: Utils.orderStatusBackground(sellerOrdersCreditmemoMpModel!.status.toString(), "#66BB6A" /*sellerOrdersShipmentMpModel.statusColorCode.toString()*/),
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              sellerOrdersCreditmemoMpModel.status?.toUpperCase() ?? "",
              style: const TextStyle(color: AppColors.white, fontSize: AppSizes.textSizeSmall),
            ),
          ),

        ],
      ));
}