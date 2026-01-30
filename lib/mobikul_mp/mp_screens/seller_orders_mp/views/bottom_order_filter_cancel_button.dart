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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';

import '../../../../mobikul/constants/app_constants.dart';

Widget bottomOrderFilterCancelButton(
    BuildContext context,
    List<OrderStatusData> items,
    // bloc,
    // bool? isLoading,
    /* Map<String, String> selectedWishlistProductList,*/
    // VoidCallback onPressed,
    {String title = MpStringConstants.proceed}) {
  return Container(
    height: AppSizes.genericButtonHeight + 10,
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
    child: Row(
      children: [
         Expanded(
         flex: 1,
           child: InkWell(
             onTap: () {
             },
             child: Container(
               height: double.infinity,
               color: AppColors.black,
               child: Center(
                   child: Text(
                     Utils.getStringValue(context, MpStringConstants.cancel) .toUpperCase()??
                         '',
                     style: const TextStyle(
                         color: AppColors.white, fontSize: 12),
                   )),
             ),
           ),
         ),
        SizedBox(width: 6,),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: AppSizes.genericButtonHeight,
            child: ElevatedButton(
              onPressed: () async {
              },
              child: Center(
                  child: Text(
                Utils.getStringValue(context, MpStringConstants.apply)
                        .toUpperCase() ??
                    '',
                style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color, fontSize: 12),
              )),
            ),
          ),
        ),
      ],
    ),

    /*Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () async {

            },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                Utils.getStringValue(
                    context, AppStringConstant.updateWishList.localized()),
                style: /*Theme.of(context).textTheme.bodyText1,*/
                    const TextStyle(
                        fontSize: AppSizes.textSizeMedium,
                        color: AppColors.textColorPrice),
              ),
            ],
          ),
          )
        ),
        const SizedBox(
          width: 1,
          height: AppSizes.bottomWishlistVertical,
          child: Divider(
            height: AppSizes.bottomWishlistVertical,
            thickness: AppSizes.size40,
            // color: AppColors.black,
          ),
        ),
        Expanded(

            child: InkWell(
          onTap: () async {
            bloc?.emit(WishlistActionState());
            bloc?.add(const MoveAllToCartEvent(""));
              //  /* items?[index]
              //                                                                   .productId ??
              //                                                               "",
              //                                                           "1",
              //                                                           "[]"*/

          },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                Utils.getStringValue(
                    context, AppStringConstant.addAllToCart.localized()),
                style: /*Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: AppSizes.textSizeMedium),*/
                    const TextStyle(
                        fontSize: AppSizes.textSizeMedium,
                        color: AppColors.textColorPrice),
              ),
            ],
          ),
        ))
      ],
    ),*/
  );
}
