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

import '../../../../mobikul/app_widgets/app_text_field.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';

Widget SellerOrderCreditMemoItem(
    NewCreditMemoItemListData? item,
    BuildContext context,
    String orderIncrementId,
    AppLocalizations? localization,
    Function(Map<String, String>) _callback) {


  final TextEditingController _firstQtyToRefundController =
  TextEditingController(text: "");

  _firstQtyToRefundController!.text = item?.qtyToRefund ?? "";


  return Container(
    padding: const EdgeInsets.only(top: AppSizes.paddingNormal),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                item?.productName != null
                    ? itemDetailView(
                    '${localization?.translate(MpStringConstants.productName)}',
                    item?.productName?.toString() ?? '',
                    context)
                    : Container(),
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
                item?.qty != null
                    ? qtyItemDetailView(
                    '${localization?.translate(MpStringConstants.qty)}',
                    item?.price ?? '',
                    context,
                    item!,
                    localization)
                    : Container(),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemReturnStockDetailView(
                    item,
                    '${localization?.translate(MpStringConstants.returnToStock)}',
                    item?.price ?? '',
                    context, _firstQtyToRefundController,
                    _callback),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailQtyToRefundView(
                    item,
                    '${localization?.translate(MpStringConstants.qtytoRefund)}',
                    item?.qtyToRefund ?? '',
                    context, _firstQtyToRefundController),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.subtotal)}',
                    item?.subTotal ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.totalTax)}',
                    item?.totalTax ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.rowTotal)}',
                    item?.rowTotal ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.discountAmount)}',
                    item?.discount ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingTiny,
                ),
                itemDetailView(
                    '${localization?.translate(MpStringConstants.rowTotal)}',
                    item?.rowTotal ?? '',
                    context),
                const SizedBox(
                  height: AppSizes.spacingGeneric,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget qtyItemDetailView(String key, String value, BuildContext context,
    NewCreditMemoItemListData item, AppLocalizations? localization) {
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
        Expanded(flex: 1, child: qtyOrderedItemList(item, localization)),
      ],
    ),
  );
}

Widget qtyOrderedItemList(
    NewCreditMemoItemListData item, AppLocalizations? localization) {
  return ListView.builder(
      itemCount: item?.qty?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemDetailView(item.qty?[index].label ?? "",
                  item.qty?[index].value.toString() ?? "", context),
            ],
          ),
        );
      });
}

Widget itemDetailQtyToRefundView(NewCreditMemoItemListData? item, String key,
    String value, BuildContext context, TextEditingController _firstQtyToRefundController) {


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
          child: AppTextField(
            controller: _firstQtyToRefundController,
            isRequired: true,
            isPassword: false,
            hintText:
            Utils.getStringValue(context, MpStringConstants.qtytoRefund),
            inputType: TextInputType.name,
          ),

        ),

      ],
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
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium
            // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
          ),
        )
      ],
    ),
  );
}

Widget itemReturnStockDetailView(NewCreditMemoItemListData? item, String key,
    String value, BuildContext context, TextEditingController _firstQtyToRefundController,  Function(Map<String, String>) _callback) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: item?.isReturnToStockChecked ?? false,
                  onChanged: (value) {
                    if (item?.isReturnToStockChecked ?? false) {
                      item?.isReturnToStockChecked = false;

                      Map<String, String> returnStock = {};
                      returnStock["isReturnToStockChecked"] = value.toString();
                      returnStock["firstQuantity"] = _firstQtyToRefundController.toString();
                      returnStock["productName"] = item?.productName?.toString() ?? '';
                      returnStock["productId"] = item?.itemId?.toString() ?? '';


                      _callback(returnStock);
                    } else {
                      item?.isReturnToStockChecked = true;
                      Map<String, String> returnStock = {};
                      returnStock["isReturnToStockChecked"] = value.toString();

                      _callback(returnStock);
                    }
                  }),
            ],
          ),
        )
      ],
    ),
  );
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
        child: Text(value, style: Theme.of(context).textTheme.bodyMedium
          // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
        ),
      ),
    ],
  );
}


