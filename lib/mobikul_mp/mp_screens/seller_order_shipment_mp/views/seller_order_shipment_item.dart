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
import '../../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';

Widget SellerOrderShipmentItem(ShipmentItemListData item,BuildContext context,
    String orderIncrementId,
    AppLocalizations? localization) {
  print("===---=-=->${item.qty?.toString()}");
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
                    ?  itemDetailView(
                    '${localization?.translate(MpStringConstants.productName)}',
                    item.productName?.toString() ?? '',
                    context)
                    : Container(),

                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.sku)}',
                    item.sku ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.qtyShipped)}',
                    item.qty?[0]?.value?.toString() ?? "" ,
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
