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
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_option_details.dart';

import '../../../../mobikul/app_widgets/image_view.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/bottom_sheet_helper.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

Widget sellerOrderItemCard(SellerItemListData? item, BuildContext context,
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
            flex: 3,
            child: Stack(children: <Widget>[
              SizedBox(
                height: (AppSizes.deviceWidth / 3),
                width: (AppSizes.deviceWidth / 3),
                child: ImageView(
                  url: item?.image,
                ),
              ),
              if (item?.option != null)
                Positioned(
                    right: 78,
                    top: 97,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context!,
                            builder: (ctx) => SellerOptionDetails(
                              item,
                            ),
                          );
                        },
                        icon: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Icon(Icons.info_outline))))
            ]),
          ),
          const SizedBox(
            width: AppSizes.size12,
          ),
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
                  child: Text(item?.name ?? '',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context!!).textTheme.displaySmall
                      // ?.copyWith(fontSize: AppSizes.textSizeMedium, color: AppColors.textColorPrimary)
                      ),
                ),
                item?.option != null
                    ? const SizedBox(
                        height: AppSizes.spacingTiny,
                      )
                    : Container(),
                /* item.option != null
                    ? itemDetailView(
                        '${localization?.translate(MpStringConstants.size)}',
                        "${item.option ?? "L"}",
                        context)
                    : Container(),
                item.option != null
                    ? const SizedBox(
                        height: AppSizes.spacingTiny,
                      )
                    : Container(),
                item.option != null
                    ? itemDetailView(
                        '${localization?.translate(MpStringConstants.color)}',
                        "${item.option ?? "red"}",
                        context)
                    : Container(),
                item.option != null
                    ? const SizedBox(
                        height: AppSizes.spacingTiny,
                      )
                    : Container(),*/
                item?.qty != null
                    ? itemQtyDetailView(
                        '${localization?.translate(MpStringConstants.qty)}',
                        (item?.qty?.Ordered ?? 5),
                        (item?.qty?.Shipped ?? 5),
                        (item?.qty?.Canceled ?? 5),
                        (item?.qty?.Refunded ?? 5),
                        localization,
                        context)
                    : Container(),

                item?.option != null
                    ? const SizedBox(
                        height: AppSizes.spacingTiny,
                      )
                    : Container(),
/*                item.option != null
                    ? itemDetailView(
                        '${localization?.translate(MpStringConstants.shippedColon)}',
                        (item.qty?.Shipped ?? 2),
                        context)
                    : Container(),*/
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.price)}',
                    item?.price ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.subtotal)}',
                    item?.subTotal ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
                itemAddReview(() {
                  reviewBottomModalSheet(context, item?.name ?? '',
                      item?.image ?? '', item?.productId ?? "", []);
                }, '${localization?.translate(MpStringConstants.writeReview)}',
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

Widget itemQtyDetailView(
    String key,
    int? orderedValue,
    int? shippedValue,
    int? cancelledValue,
    int? refundedValue,
    AppLocalizations? localization,
    BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
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
        flex: 0,
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${localization?.translate(MpStringConstants.ordered)}',
                  style: Theme.of(context).textTheme.bodyMedium
                  // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
                  ),

              Text("-", style: Theme.of(context).textTheme.bodyMedium),

              Text(orderedValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall
                  // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
                  ),
            ],
          ),

          const SizedBox(
            height: AppSizes.spacingGeneric,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${localization?.translate(MpStringConstants.shipped)}',
                  style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              ),
              Text("-", style: Theme.of(context).textTheme.bodyMedium),
              Text(shippedValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall
                // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spacingGeneric,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${localization?.translate(MpStringConstants.cancelled)}',
                  style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              ),
              Text("-", style: Theme.of(context).textTheme.bodyMedium),
              Text(cancelledValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall
                // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spacingGeneric,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${localization?.translate(MpStringConstants.refunded)}',
                  style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              ),
              Text("-", style: Theme.of(context).textTheme.bodyMedium),
              Text(refundedValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall
                // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
              ),
            ],
          )
        ],
      ),
      ),
    ],
  );
}

Widget itemDetailView(String key, String value, BuildContext context) {
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
             Icon(
              Icons.rate_review_outlined,
              size: AppSizes.size16,
              color: Theme.of(context).textTheme?.labelLarge?.color,
            ),
            const SizedBox(
              width: AppSizes.size4,
            ),
            Text((title.toUpperCase() ?? ''),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.textSizeMedium,
                    color: Theme.of(context).textTheme?.labelLarge?.color,))
          ],
        ),
      ),
    ),
  );
}
