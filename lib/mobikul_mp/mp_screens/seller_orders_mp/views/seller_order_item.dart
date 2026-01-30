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

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_arguments_map.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/constants/app_routes.dart';
import '../../../../mobikul/constants/app_string_constant.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_string_constants.dart';
import '../../../mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';

Widget sellerOrderItem(BuildContext context, SellerOrderListData? item,
    ValueChanged<Int>? callBack) {
  final VoidCallback? onTap;

  Widget getListItem(String key, String value) {
    return Row(
      children: [
        Expanded(child: Text(key)),
        const Text(":"),
        Expanded(
            child: Text(
          value,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        )),
      ],
    );
  }

  IconData? iconLeft;
  String? titleLeft;

  return Container(
    padding: const EdgeInsets.only(
        top: AppSizes.size8, left: AppSizes.size8, right: AppSizes.size8),
    margin: const EdgeInsets.only(bottom: AppSizes.size8),
    color: Theme.of(context).cardColor,
    // child: Card(

    child: InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.sellerOrderDetails,
          arguments: getSellerOrderDetail(item?.incrementId.toString() ?? "",item?.orderId.toString() ?? "")
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.size8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${item?.incrementId.toString() ?? " "}",
                        // style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: AppSizes.textSizeLarge, color: AppColors.textColorPrimary),
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            // color: AppColors.textColorPrimary,
                            fontSize: AppSizes.textSizeLarge),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.size14,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingGeneric,
                    vertical: AppSizes.spacingTiny),
                decoration: BoxDecoration(
                    color: Utils.orderStatusBackground(item!.status.toString(),
                        item.statusColorCode.toString()),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  item.status?.toUpperCase() ?? "",
                  style: const TextStyle(
                      color: AppColors.white, fontSize: AppSizes.textSizeSmall),
                ),
              ),
              const SizedBox(
                height: AppSizes.size14,
              ),
              Text(
                '${item?.customerDetails!.name}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorPrimary,
                    fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.size8,
              ),
              Text(
                '${item?.customerDetails!.date}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorPrimary,
                    fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.size8,
              ),
              Text(
                '${Utils.getStringValue(context, MpStringConstants.orderTotalBase) ?? ''} ${item?.customerDetails!.baseTotal}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorPrimary,
                    fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.size8,
              ),
              Text(
                '${Utils.getStringValue(context, MpStringConstants.orderTotalPurchased) ?? ''} ${item?.customerDetails!.purchaseTotal}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorPrimary,
                    fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.size8,
              ),
            ]),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.sellerOrderDetails,
                      arguments: getSellerOrderDetail(item.incrementId.toString() ?? "",item.orderId.toString() ?? "")
                  );
                },
                icon: const Icon(Icons.keyboard_arrow_right))
          ],
        ),
      ),
    ),
  );
}

Widget statusContainer(
    BuildContext context, String status, String statusColorCode) {
  return Container(
    color: Utils.orderStatusBackground(status, statusColorCode),
    padding: const EdgeInsets.symmetric(
        vertical: AppSizes.size8 / 2, horizontal: AppSizes.size8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
          status.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white, fontSize: AppSizes.textSizeMedium),
        )),
      ],
    ),
  );
}
