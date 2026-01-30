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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/views/seller_invoice_order_price_details.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_option_details.dart';

import '../../../../mobikul/app_widgets/image_view.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/bottom_sheet_helper.dart';
import '../../../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../../seller_order_details_mp/views/seller_order_item_card.dart';

Widget sellerInvoiceOrderItemCard(InvoiceItemListModel item, BuildContext context,
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
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.size8,
                    horizontal: AppSizes.size8,
                  ),
                  child: Text(item.productName ?? '',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall
                      // ?.copyWith(fontSize: AppSizes.textSizeMedium, color: AppColors.textColorPrimary)
                      ),
                ),

/*
                item.qty != null
                    ? itemDetailView(
                        '${localization?.translate(MpStringConstants.qty)}',
                        (item.qty?.Ordered ?? 5),
                        context)
                    : Container(),
*/


                /*    const SizedBox(
                  height: AppSizes.size8,
                ),

                sellerInvoiceOrderPriceDetails(item,
                    context, AppLocalizations.of(context)),*/

                const SizedBox(
                  height: AppSizes.size8,
                )
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
          child: Text(value, style: Theme.of(context).textTheme.displaySmall
              // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
              ),
        ),
      ],
    ),
  );
}

Widget itemAddReview(
    VoidCallback callback, String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0.0),
    child: Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacingLarge, vertical: AppSizes.spacingGeneric),
      child: ElevatedButton(
        onPressed: callback,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Icon(
              Icons.rate_review_outlined,
              size: AppSizes.size16,
              color: AppColors.white,
            ),
            const SizedBox(
              width: AppSizes.size4,
            ),
            Text((title.toUpperCase() ?? ''),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.textSizeMedium,
                    color: AppColors.white))
          ],
        ),
      ),
    ),
  );
}
