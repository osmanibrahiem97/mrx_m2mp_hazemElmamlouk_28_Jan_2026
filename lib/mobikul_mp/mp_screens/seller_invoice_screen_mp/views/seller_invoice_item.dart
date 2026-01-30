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
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/bottom_sheet_helper.dart';
import 'package:test_new/mobikul/models/order_details/order_detail_model.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../../mobikul/screens/product_detail/widgets/file_download.dart';
import '../../../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';

Widget SellerinvoiceItem(InvoiceItemListModel item,BuildContext context,
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
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.size8,
                  ),
                  child: Text(item.productName ?? '',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall
                    // ?.copyWith(fontSize: AppSizes.textSizeMedium, color: AppColors.textColorPrimary)
                  ),
                ),
                item.customOption != null
                    ? const SizedBox(
                  height: AppSizes.spacingTiny,
                )
                    : Container(),

                item.qty != null
                    ? qtyItemDetailView(
                    '${localization?.translate(MpStringConstants.qty)}',
                    item.price ?? '',
                    context, item, localization)
                    : Container(),


                item.customOption != null
                    ? const SizedBox(
                  height: AppSizes.spacingTiny,
                ) : Container(),

                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.price)}',
                    item.price ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.subtotal)}',
                    item.subTotal ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.totalPrice)}',
                    item.totalPrice ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.adminCommission)}',
                    item.adminCommission ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.vendorTotal)}',
                    item.vendorTotal ?? '',
                    context),

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

Widget qtyItemDetailView(String key, String value, BuildContext context, InvoiceItemListModel item,
    AppLocalizations? localization) {
  return Padding(
    padding: const EdgeInsets.only(
        top: AppSizes.linePadding, left: AppSizes.linePadding),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: qtyOrderedItemList(item, localization)
        ),
      ],
    ),
  );
}


Widget qtyOrderedItemList(InvoiceItemListModel item,
    AppLocalizations? localization) {
  return ListView.builder(
      itemCount: item?.qty?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemDetailOrderedView(
                  item.qty?[index].label ?? "",
                  item.qty?[index].value.toString() ?? "",
                  context),

            ],
          ),
        );
      });
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
        child: Text(value, style: Theme.of(context).textTheme.displaySmall
          // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
        ),
      ),
    ],
  );
}
