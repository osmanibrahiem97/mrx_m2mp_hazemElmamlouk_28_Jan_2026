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
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_address_item_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_heading_view.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';


Widget SellerOrderViewRefundPaymentInfo(BuildContext context,
    AppLocalizations? localizations, SellerOrdersViewRefundMpModel? sellerOrdersViewRefundMpModel) {
  return sellerOrderHeaderLayout(
      context,
      localizations?.translate(MpStringConstants.addressInformation) ?? "",
      Column(
        children: [
          if(sellerOrdersViewRefundMpModel?.shippingAddress?.isNotEmpty==true)...[
            sellerAddressItemWithHeading(
              context,
              localizations?.translate(MpStringConstants.shippingAddress) ??
                  "",
              sellerOrdersViewRefundMpModel?.shippingAddress ?? "",
              isElevated: false),
          ],
          if(sellerOrdersViewRefundMpModel?.billingAddress?.isNotEmpty==true)
          // addressItemWithHeading(
          sellerAddressItemWithHeading(
              context,
              localizations?.translate(MpStringConstants.billingAddress) ?? "",
              sellerOrdersViewRefundMpModel?.billingAddress ?? "",
              isElevated: false),

          if(sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true || sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true)
            orderViewRefundMethod(context, AppLocalizations.of(context), sellerOrdersViewRefundMpModel),

          if(sellerOrdersViewRefundMpModel?.paymentMethod?.isNotEmpty==true || sellerOrdersViewRefundMpModel?.paymentMethod?.isNotEmpty==true)
            orderPaymentMethod(context, AppLocalizations.of(context), sellerOrdersViewRefundMpModel),
        ],
      ),);
}


Widget orderShippingAndTrackingMethod(BuildContext context,
    AppLocalizations? localizations, SellerOrdersViewRefundMpModel? sellerOrdersViewRefundMpModel) {
  return Column(
    children: [

      if(sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true)
        sellerOrderViewRefundPaymentMethodView(
            context,
            localizations?.translate(MpStringConstants.shippingAndTrackingInfo).toUpperCase() ?? "",
            sellerOrdersViewRefundMpModel?.shippingMethod ?? "",
            isElevated: false),
    ],
  );
}

Widget orderViewRefundMethod(BuildContext context,
    AppLocalizations? localizations, SellerOrdersViewRefundMpModel? sellerOrdersViewRefundMpModel) {
  return Column(
    children: [

      if(sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true)
        sellerOrderViewRefundPaymentMethodView(
            context,
            localizations?.translate(MpStringConstants.shippingMethod).toUpperCase() ?? "",
            sellerOrdersViewRefundMpModel?.shippingMethod ?? "",
            isElevated: false),
    ],
  );
}

Widget orderPaymentMethod(BuildContext context,
    AppLocalizations? localizations, SellerOrdersViewRefundMpModel? sellerOrdersViewRefundMpModel) {
  return Column(
    children: [

      if(sellerOrdersViewRefundMpModel?.paymentMethod?.isNotEmpty==true)
        sellerOrderViewRefundPaymentMethodView(
            context,
            localizations?.translate(MpStringConstants.paymentMethods).toUpperCase() ?? "",
            sellerOrdersViewRefundMpModel?.paymentMethod ?? "",
            isElevated: false),
    ],
  );
}


Widget sellerOrderViewRefundPaymentMethodView(
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


