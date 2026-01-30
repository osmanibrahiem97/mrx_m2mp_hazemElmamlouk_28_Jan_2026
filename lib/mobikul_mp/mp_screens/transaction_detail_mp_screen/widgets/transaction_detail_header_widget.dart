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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';

class TransactionDetailHeaderWidget extends StatelessWidget {
  const TransactionDetailHeaderWidget({
    super.key,
    required this.transactionDetailMpModel,
  });

  final TransactionDetailMpModel? transactionDetailMpModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.deviceWidth / 1,
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transactionDetailMpModel!.date ?? ''),
            const SizedBox(
              height: 5.0,
            ),
            Text(transactionDetailMpModel!.amount ?? ''),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${Utils.getStringValue(context, MpStringConstants.type)} : '),
                Text(
                  transactionDetailMpModel!.amount ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${Utils.getStringValue(context, MpStringConstants.method)} : '),
                Text(
                  transactionDetailMpModel!.method ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            if (transactionDetailMpModel?.comment?.isNotEmpty??false)
              Column(
                children: [
                  Text(Utils.getStringValue(context, MpStringConstants.remark)),
                  const SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    transactionDetailMpModel?.comment ?? '',
                    style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
