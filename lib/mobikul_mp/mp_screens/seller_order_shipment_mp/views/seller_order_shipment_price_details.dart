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
import 'package:test_new/mobikul_mp/mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_heading_view.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';


Widget sellerOrderShipmentPriceDetails(SellerOrdersShipmentMpModel model, BuildContext context,
    AppLocalizations? localizations) {
  return sellerOrderHeaderLayout(
      context,
      localizations?.translate(MpStringConstants.priceDetails) ?? "",
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.size10),
        child: Column(
/*          children:
            (model.totals??[]).map((e) => sellerOrderShipmentPriceDetailsItem(
                e.label ?? "",
                e.formattedValue??"",
                context)

            ).toList(),*/
        ),
      )
  );
}

Widget sellerOrderShipmentPriceDetailsItem(String key, String value, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSizes.size8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          key,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
            // color: AppColors.textColorSecondary,
              fontSize: AppSizes.textSizeMedium),

          // Theme.of(context).textTheme.bodyMedium!.apply()
          // ?.apply(color: AppColors.textColorSecondary),
        ),
        Text(value.toString(), style: Theme.of(context).textTheme.displaySmall
            // ?.apply(color: AppColors.textColorPrimary),
          ),
      ],
    ),
  );
}
