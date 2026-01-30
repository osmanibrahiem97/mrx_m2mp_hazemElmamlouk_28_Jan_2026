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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/bottom_sheet_helper.dart';
import 'package:test_new/mobikul/models/order_details/order_detail_model.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

import '../../../../mobikul/helper/utils.dart';
import '../../../../mobikul/screens/product_detail/widgets/file_download.dart';
import '../../../mp_helper/mp_bottom_sheet_helper.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';


Widget SellerOrderRefundItem(
    BuildContext context, CreditMemoListData? item,  String incrementId,  Function downloadInvoice, bool downloadRefund) {
  IconData? iconLeft;
  return Container(
    padding: const EdgeInsets.all(AppSizes.size8),
    margin: const EdgeInsets.only(bottom: AppSizes.size8),
    color: Theme.of(context).cardColor,
    // child: Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.size8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(context, MpStringConstants.refund),
                      style: Theme.of(context).textTheme.displaySmall
                          // ?.copyWith(
                          // color: AppColors.textColorPrimary,
                          // fontSize: AppSizes.textSizeMedium),
                    ),
                    Text(
                      "#${item?.incrementId.toString() ?? " "}",
                      style: Theme.of(context).textTheme.displayMedium
                          // ?.copyWith(
                          // color: AppColors.textColorPrimary,
                          // fontSize: AppSizes.textSizeLarge),
                    ),
                    const SizedBox(
                      height: AppSizes.linePadding,
                    ),

                  ],
                ),
              ],
            ),

            const SizedBox(
              height: AppSizes.size16,
            ),

            const Divider(
              thickness: 1,
              height: 1,
            ),


            const SizedBox(
              height: AppSizes.size16,
            ),
            Row(
              mainAxisAlignment: downloadRefund ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  // width: MediaQuery.of(context).size.width / 2.5,
                  height: AppSizes.genericButtonHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      viewRefundSellerBottomModelSheet(context, item?.entityId.toString(),
                          incrementId.toString());
                      print(item?.entityId.toString());
                      print(incrementId.toString());

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconLeft ?? Icons.view_carousel,
                          size: AppSizes.size20,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        const SizedBox(
                          width: AppSizes.paddingGeneric,
                        ),
                        Text(
                          (Utils.getStringValue(
                              context, MpStringConstants.viewRefund) ??
                              '')
                              .toUpperCase(),
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                              fontSize: AppSizes.textSizeSmall),
                        )
                      ],

                      // ),
                    ),
                  ),
                ),
                if (downloadRefund)
                  Container(
                    padding: const EdgeInsets.all(5),
                    // width: MediaQuery.of(context).size.width / 2.5,
                    height: AppSizes.genericButtonHeight,
                    child: OutlinedButton(
                        onPressed: () async {
                          downloadInvoice();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              iconLeft ?? Icons.save_alt,
                              size: AppSizes.size20,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(
                              width: AppSizes.paddingGeneric,
                            ),
                            Text(
                              (Utils.getStringValue(
                                  context, MpStringConstants.saveRefund) ??
                                  '')
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                  fontSize: AppSizes.textSizeSmall),
                            )
                          ],
                        )),
                  )
              ],
            ),

            const SizedBox(
              height: AppSizes.size8,
            ),

          ],
        ),
      ),
    // ),
  );
}


