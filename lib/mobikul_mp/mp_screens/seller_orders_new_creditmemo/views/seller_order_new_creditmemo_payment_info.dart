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
import 'package:test_new/mobikul_mp/mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_address_item_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_heading_view.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';


Widget SellerOrdersCreditMemoPaymentInfo(BuildContext context,
    AppLocalizations? localizations, SellerOrdersCreditmemoMpModel? sellerOrdersCreditmemoMpModel) {
  return sellerOrderHeaderLayout(
      context,
      localizations?.translate(MpStringConstants.addressInformation) ?? "",
      Column(
        children: [
          if(sellerOrdersCreditmemoMpModel?.shippingAmount?.isNotEmpty==true)...[
            sellerAddressItemWithHeading(
              context,
              localizations?.translate(MpStringConstants.shippingAddress) ??
                  "",
              sellerOrdersCreditmemoMpModel?.shippingAmount ?? "",
              isElevated: false),
          ],
          if(sellerOrdersCreditmemoMpModel?.billingAddress?.isNotEmpty==true)
          // addressItemWithHeading(
          sellerAddressItemWithHeading(
              context,
              localizations?.translate(MpStringConstants.billingAddress) ?? "",
              sellerOrdersCreditmemoMpModel?.billingAddress ?? "",
              isElevated: false),

          // if(sellerOrdersCreditmemoMpModel?.shippingAmount?.isNotEmpty==true || sellerOrdersCreditmemoMpModel?.shippingAmount?.isNotEmpty==true)
          //   orderCreditMemoPaymentMethod(context, AppLocalizations.of(context), sellerOrdersCreditmemoMpModel),

          if(sellerOrdersCreditmemoMpModel?.paymentMethod?.isNotEmpty==true || sellerOrdersCreditmemoMpModel?.paymentMethod?.isNotEmpty==true)
            orderCreditMemoShippingMethod(context, AppLocalizations.of(context), sellerOrdersCreditmemoMpModel),
        ],
      ),);
}



Widget orderCreditMemoShippingMethod(BuildContext context,
    AppLocalizations? localizations, SellerOrdersCreditmemoMpModel? sellerOrdersCreditmemoMpModel) {
  return Column(
    children: [

      if(sellerOrdersCreditmemoMpModel?.shippingAmount?.isNotEmpty==true)
        sellerOrdersCreditMemoPaymentMethodView(
            context,
            sellerOrdersCreditmemoMpModel?.shippingAmountHeading ?? "",
            sellerOrdersCreditmemoMpModel?.shippingAmount ?? "",
            isElevated: false),
    ],
  );
}


Widget sellerOrdersCreditMemoPaymentMethodView(
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


