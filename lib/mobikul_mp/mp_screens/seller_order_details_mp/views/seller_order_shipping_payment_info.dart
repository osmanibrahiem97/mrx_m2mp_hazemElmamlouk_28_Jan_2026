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
import 'package:flutter_html/flutter_html.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_address_item_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_heading_view.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/constants/app_string_constant.dart';
import '../../../../mobikul/helper/app_localizations.dart';


Widget sellerShippingPaymentInfo(BuildContext context,
    AppLocalizations? localizations, SellerOrderDetailsMpModel? orderModel) {
  return sellerOrderHeaderLayout(
      context,
      localizations?.translate(MpStringConstants.shippingPaymentInfo) ?? "",
      Column(
        children: [
          if(orderModel?.shippingAddress?.isNotEmpty==true)...[
            sellerAddressItemWithHeading(
              context,
              localizations?.translate(AppStringConstant.shippingAddress) ??
                  "",
              orderModel?.shippingAddress ?? "",
              isElevated: false),
          ],
          if(orderModel?.billingAddress?.isNotEmpty==true)
          // addressItemWithHeading(
          sellerAddressItemWithHeading(
              context,
              localizations?.translate(MpStringConstants.billingAddress) ?? "",
              orderModel?.billingAddress ?? "",
              isElevated: false),
          if(orderModel?.shippingMethod?.isNotEmpty==true || orderModel?.paymentMethod?.isNotEmpty==true)
            shippingPaymentMethod(context, AppLocalizations.of(context), orderModel),
        ],
      ),);
}


Widget shippingPaymentMethod(BuildContext context,
    AppLocalizations? localizations, SellerOrderDetailsMpModel? orderModel) {
  return Column(
    children: [
      if(orderModel?.shippingMethod?.isNotEmpty==true)...[
        shippingPaymentMethodView(
            context,
            localizations?.translate(MpStringConstants.shippingMethod).toUpperCase() ??
                "",
            orderModel?.shippingMethod ?? "",
            isElevated: false),
        const SizedBox(
          height: AppSizes.spacingNormal,
        ),],
      if(orderModel?.paymentMethod?.isNotEmpty==true)
        shippingPaymentMethodView(
            context,
            localizations?.translate(MpStringConstants.paymentMethods).toUpperCase() ?? "",
            orderModel?.paymentMethod ?? "",
            isElevated: false),
    ],
  );
}

Widget shippingPaymentMethodView(
    BuildContext context, String title, String address,
    {Widget? addressList,
      Widget? actions,
      bool? showDivider,
      bool? isElevated,
      VoidCallback? callback}) {
  return Card(
    elevation: (isElevated ?? true) ? AppSizes.linePadding : 0,
    child: Container(
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.size8,top:AppSizes.size8,right:AppSizes.size8,bottom:0.0),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.lightGray),
            ),
          ),
          if (showDivider ?? false)
            const Divider(
              thickness: 1,
              height: 1,
            ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top:0.0,right:AppSizes.size8,bottom:0.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (callback != null) ? callback : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Html(data:address)),
                  // Text(address),
                  if(callback != null) const Icon(Icons.navigate_next, color: AppColors.lightGray,)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
