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
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

class TransactionDetailListViewWidget extends StatefulWidget {
  final TransactionDetailMpModel transactionDetailMpModel;
  const TransactionDetailListViewWidget(
    this.transactionDetailMpModel, {
    super.key,
  });

  @override
  State<TransactionDetailListViewWidget> createState() =>
      _TransactionDetailListViewWidgetState();
}

class _TransactionDetailListViewWidgetState
    extends State<TransactionDetailListViewWidget> {
  bool isShowRemark = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.transactionDetailMpModel!.orderList!.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(context,
                          MpStringConstants.transactionOrderInfo).toUpperCase(),
                    ),
                    const SizedBox(height: 5.0),
                    const Divider(),
                    const SizedBox(height: 5.0),
                    Text(
                        widget.transactionDetailMpModel!.orderList![index]
                                .incrementId ??
                            "",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${Utils.getStringValue(context, MpStringConstants.price)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .price ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.qty)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .qty ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.totalPrice)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .totalPrice ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.totalTax)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .totalTax ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.totalShipping)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .shipping ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.commission)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .commission ??
                              '',
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
                            '${Utils.getStringValue(context, MpStringConstants.subtotal)} : '),
                        Text(
                          widget.transactionDetailMpModel!.orderList![index]
                                  .subTotal ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
