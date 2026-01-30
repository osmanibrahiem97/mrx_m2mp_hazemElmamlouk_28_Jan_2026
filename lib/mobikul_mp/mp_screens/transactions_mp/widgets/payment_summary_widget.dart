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

import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final TransactionMpModel transactionMpModel;
  VoidCallback onPressedWithdraw;
  PaymentSummaryWidget(
    this.transactionMpModel, this.onPressedWithdraw, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
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
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Text(
                            Utils.getStringValue(
                                    context, MpStringConstants.totalSale) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              transactionMpModel.totalSale ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Text(
                            Utils.getStringValue(
                                    context, MpStringConstants.totalTax) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                transactionMpModel.totalTax ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.clip,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Text(
                            Utils.getStringValue(context,
                                    MpStringConstants.totalCommission) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              transactionMpModel.totalCommission ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spacingGeneric,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Text(
                            Utils.getStringValue(context,
                                    MpStringConstants.remainingTransactions) ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(':', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(
                          width: AppSizes.deviceWidth / 2.3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              transactionMpModel.remainingTransactionAmount ??
                                  '',
                              style: Theme.of(context).textTheme.titleLarge,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: () {
                          onPressedWithdraw();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallet,
                              color: Theme.of(context).textTheme?.labelLarge?.color,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                                Utils.getStringValue(context,
                                            MpStringConstants.requestWithDraw)
                                        .toUpperCase() ??
                                    '',
                                style: TextStyle(color:Theme.of(context).textTheme?.labelLarge?.color,))
                          ],
                        ))
                  ]),
            )
          ]),
    );
  }
}
