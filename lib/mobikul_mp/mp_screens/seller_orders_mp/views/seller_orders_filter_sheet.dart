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
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

class SellerOrdersFilterSheet extends StatefulWidget {
  const SellerOrdersFilterSheet({Key? key}) : super(key: key);

  @override
  _SellerOrdersFilterSheetState createState() => _SellerOrdersFilterSheetState();
}

class _SellerOrdersFilterSheetState extends State<SellerOrdersFilterSheet> {
  // Controller
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  //For now
  var genderOption = [
    'Male',
    'Female',
    'Others',
  ];

  void _clearAll() {
    setState(() {
      transactionIdController.clear();
      fromDateController.clear();
      toDateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.filters), context,
          isLeadingEnable: true, onPressed: () {
        Navigator.pop(context);
      }, actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ElevatedButton(
            onPressed: _clearAll,
            child: const Text(
              MpStringConstants.clearAll,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                    initiallyExpanded: true,
                    // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                    title: Text(
                        Utils.getStringValue(context,
                                    MpStringConstants.searchTransaction)
                                .toUpperCase() ??
                            '',
                        style: Theme.of(context).textTheme.titleLarge),
                    children: [
                      AppTextField(
                          controller: transactionIdController,
                          hintText: Utils.getStringValue(
                                  context, MpStringConstants.transactionId) ??
                              '',
                          isPassword: false),
                      const SizedBox(height: 15.0),
                    ]),
              ),
              const SizedBox(height: 15.0),
              Container(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                    initiallyExpanded: true,
                    // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                    title: Text(
                        Utils.getStringValue(
                                    context, MpStringConstants.transactionDate)
                                .toUpperCase() ??
                            '',
                        style: Theme.of(context).textTheme.titleLarge),
                    children: [
                      AppTextField(
                          controller: transactionIdController,
                          hintText: Utils.getStringValue(
                                  context, MpStringConstants.fromDate) ??
                              '',
                          isPassword: false),
                      const SizedBox(height: 15.0),
                      AppTextField(
                          controller: transactionIdController,
                          hintText: Utils.getStringValue(
                                  context, MpStringConstants.toDate) ??
                              '',
                          isPassword: false),
                    ]),
              ),

              const SizedBox(height: 20.0),
              SizedBox(
                height: 48,
                width: AppSizes.deviceWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    MpStringConstants.apply,
                    style: TextStyle(color:Theme.of(context).textTheme?.labelLarge?.color),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 48,
              //   width: AppSizes.deviceWidth,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //         flex: 1,
              //         child: ElevatedButton(
              //           onPressed: _clearAll,
              //           child: const Text(
              //             MpStringConstants.cancel,
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10.0,
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: ElevatedButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           child: const Text(
              //             MpStringConstants.apply,
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
