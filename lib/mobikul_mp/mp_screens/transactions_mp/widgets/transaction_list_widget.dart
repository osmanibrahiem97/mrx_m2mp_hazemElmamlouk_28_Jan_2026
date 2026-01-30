
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
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';

class TransactionListWidget extends StatefulWidget {
  final TransactionMpModel transactionMpModel;
  const TransactionListWidget(
    this.transactionMpModel, {
    super.key,
  });

  @override

  State<TransactionListWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.transactionMpModel!.transactionList!.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                            widget.transactionMpModel!.transactionList![index]
                                    .transactionId ??
                                "",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        Text(

                            widget.transactionMpModel!.transactionList![index]
                                    .date ??
                                "",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        Text(
                            widget.transactionMpModel!.transactionList![index]
                                    .amount ??
                                "",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (widget.transactionMpModel!.transactionList![index]
                                  .showRemark??false) {
                                widget.transactionMpModel!.transactionList![index]
                                    .showRemark = false;
                              } else {
                                widget.transactionMpModel!.transactionList![index]
                                    .showRemark = true;
                              }

                            });
                          },
                          child: Text(
                              Utils.getStringValue(
                                  context, MpStringConstants.transactionRemark),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue)),
                        ),
                        Visibility(
                          visible: widget.transactionMpModel!.transactionList![index].showRemark??false,
                          child: const SizedBox(
                            height: AppSizes.spacingGeneric,
                          ),
                        ),
                        Visibility(
                          visible: widget.transactionMpModel!.transactionList![index].showRemark??false,
                          child: Text(
                              widget.transactionMpModel!.transactionList![index]
                                      .comment ??
                                  "",
                              style: Theme.of(context).textTheme.titleLarge),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.transactionDetailMp, arguments: widget.transactionMpModel!.transactionList![index].id ?? "");
                        },
                        icon: const Icon(Icons.keyboard_arrow_right))
                  ],
                )),
          );
        },
      ),
    );
  }
}
