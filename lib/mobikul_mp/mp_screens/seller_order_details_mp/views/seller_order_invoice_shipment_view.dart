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
import 'package:test_new/mobikul_mp/mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/constants/app_routes.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_arguments_map.dart';


Widget sellerOrderInvoiceShipmentViewContainer(BuildContext context,
    SellerOrderDetailsMpModel? orderModel, AppLocalizations? localization) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if ((orderModel?.invoiceId ?? "").isNotEmpty && (orderModel?.invoiceId != "0"))
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.sellerInvoiceDetails,
                  arguments: getSellerCreateCreditMemoData(orderModel?.incrementId, orderModel?.invoiceId,orderModel?.invoiceIncrement));
            },
            child: Column(children: [
              Text(
                Utils.getStringValue(context, MpStringConstants.invoices),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.paddingMedium,
              ),
            ])
        ),
      if ((orderModel?.shipmentId ?? "").isNotEmpty  && (orderModel?.shipmentId != "0"))
        InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.sellerOrderShipmentDetails,
                arguments: getSellerShipmentDetail(orderModel?.incrementId, orderModel?.shipmentId , orderModel?.shipmentIncrement),
              );
            },
            child: Column(children: [
              const SizedBox(
                height: AppSizes.paddingMedium,
              ),
              Text(
                Utils.getStringValue(context, MpStringConstants.orderShipment),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.paddingMedium,
              ),
            ])),

      // Refund Seller Order
      if ((orderModel?.creditMemoList ?? []).isNotEmpty && (orderModel?.creditMemoList?.first.incrementId!=null))
        InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.sellerOrderRefundScreen,
                arguments: orderModel,
              );
            },
            child: Column(children: [
              const SizedBox(
                height: AppSizes.paddingMedium,
              ),
              Text(
                Utils.getStringValue(context, MpStringConstants.refund),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: AppSizes.textSizeMedium),
              ),
              const SizedBox(
                height: AppSizes.paddingMedium,
              ),
            ])),
    ],
  );
}
