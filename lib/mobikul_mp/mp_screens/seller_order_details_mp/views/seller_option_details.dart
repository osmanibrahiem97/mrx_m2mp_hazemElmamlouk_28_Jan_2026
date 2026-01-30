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
import 'package:test_new/mobikul/helper/constants_helper.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

import '../../../../mobikul/constants/app_constants.dart';
import '../../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';


class SellerOptionDetails extends StatefulWidget {
  const SellerOptionDetails(this.item, {Key? key}): super(key: key);
  final SellerItemListData? item;

  @override
  State<SellerOptionDetails> createState() => _SellerOptionDetailsState();
}

class _SellerOptionDetailsState extends State<SellerOptionDetails> {
  String? groupValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(groupValue);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          elevation: 0,
          title: Text(
            Utils.getStringValue(context, MpStringConstants.optionDetails).toUpperCase(),
              style: Theme.of(context)
                  .textTheme.displaySmall
                  ?.copyWith(fontSize: AppSizes.textSizeSmall,
                   fontWeight: FontWeight.w500,
                   wordSpacing: 0.5,
                   color: AppColors.white
              )
          ),
          automaticallyImplyLeading: false,
          // Uncomment this if you require a close button
          // leeading: const CloseButton()
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.size14,vertical: AppSizes.size14
          ),
          child: Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(Utils.getStringValue(context, AppStringConstant.size),
                        style: Theme.of(context)
                            .textTheme.bodyMedium
                            ?.copyWith(fontSize: AppSizes.textSizeSmall, )
                            // color: AppColors.textColorSecondary)
                    )),
                    Text(" "),
                    Expanded(child: Text("${widget.item?.option??"XL"}",
                        style: Theme.of(context)
                            .textTheme.displaySmall
                            ?.copyWith(fontSize: AppSizes.textSizeSmall, )
                            // color: AppColors.textColorPrimary)
                    )
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Text(Utils.getStringValue(context, AppStringConstant.color),
                        style: Theme.of(context)
                            .textTheme.bodyMedium
                            ?.copyWith(fontSize: AppSizes.textSizeSmall, )
                            // color: AppColors.textColorSecondary)
                    ),
                    ),
                    Text(" "),
                    Expanded(child: Text("${widget.item?.option??"black"}",
                        style: Theme.of(context)
                            .textTheme.displaySmall
                            ?.copyWith(fontSize: AppSizes.textSizeSmall,))
                            // color: AppColors.textColorPrimary))
                    )

                  ],
                ),
              ],
            )
          ),
        ),
      ],
    );
  }
}