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

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';

Widget SellerOrderViewRefundItem(ViewRefundItemListData item,BuildContext context,
    String orderIncrementId,
    AppLocalizations? localization) {
  return Container(
    padding: const EdgeInsets.only(top: AppSizes.paddingNormal),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                item.productName != null
                    ? Text(
                  '${localization?.translate(MpStringConstants.itemName)}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(
                    // color: AppColors.textColorSecondary,
                      fontSize: AppSizes.textSizeMedium),

                  // Theme.of(context).textTheme.bodyMedium!.apply()
                  // ?.apply(color: AppColors.textColorSecondary),
                ) : Container(),

                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),

                item.productName != null
                    ? Text(
                  item.productName?.toString() ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(
                    // color: AppColors.textColorSecondary,
                      fontSize: AppSizes.textSizeMedium),
                )
                    : Container(),

                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.price).toUpperCase()}',
                    item.price ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),

                itemDetailView(
                    '${localization?.translate(MpStringConstants.qty).toUpperCase()}',
                    item.qty?.toString() ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),

                itemDetailView(
                    '${localization?.translate(MpStringConstants.subtotal).toUpperCase()}',
                    item.subTotal?.toString() ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),

                itemDetailView(
                    '${localization?.translate(MpStringConstants.taxAmount).toUpperCase()}',
                    item.totalTax?.toString() ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),

                itemDetailView(
                    '${localization?.translate(MpStringConstants.discountAmount).toUpperCase()}',
                    item.discountTotal?.toString() ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.rowTotal).toUpperCase()}',
                    item.rowTotal?.toString() ?? '',
                    context),

                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}


Widget itemDetailView(String key, String value, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
        top: AppSizes.linePadding, left: AppSizes.linePadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(key, style: Theme.of(context).textTheme.bodyMedium
            // ?.apply(color: AppColors.textColorSecondary)
            // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorSecondary)
          ),
        ),
        const SizedBox(
          width: 14.0,
        ),
        Expanded(
            flex: 1,
            child: Text("-", style: Theme.of(context).textTheme.bodyMedium
              // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
            )),
        Expanded(
          flex: 1,
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium
            // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
          ),
        ),

      ],
    ),
  );
}



Widget itemDetailOrderedView(String key, String value, BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Text(key, style: Theme.of(context).textTheme.bodyMedium
          // ?.apply(color: AppColors.textColorSecondary)
          // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorSecondary)
        ),
      ),
      const SizedBox(
        width: 14.0,
      ),
      Expanded(
          flex: 1,
          child: Text("-", style: Theme.of(context).textTheme.bodyMedium
            // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
          )),
      Expanded(
        flex: 1,
        child: Text(value, style: Theme.of(context).textTheme.bodyMedium
          // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
        ),
      ),
    ],
  );
}
