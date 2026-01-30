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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.paymentSummary)
                      .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            Utils.getStringValue(
                                    context, MpStringConstants.totalSale) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        Text('\$5,431.95',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            Utils.getStringValue(
                                    context, MpStringConstants.totalTax) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        Text('\$0.00',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            Utils.getStringValue(context,
                                    MpStringConstants.totalCommission) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        Text('\$0.00',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            Utils.getStringValue(context,
                                    MpStringConstants.remainingTransactions) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        Text('\$2,225.12',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.wallet, color: AppColors.white),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                                Utils.getStringValue(context,
                                            MpStringConstants.requestWithDraw)
                                        .toUpperCase() ??
                                    '',
                                style: const TextStyle(color: AppColors.white))
                          ],
                        )),
                  ],
                )),
          ]),
    );
  }
}
