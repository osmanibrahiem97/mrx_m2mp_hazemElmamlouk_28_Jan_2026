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
import 'package:test_new/mobikul/helper/app_storage_pref.dart';

import '../../../../mobikul/app_widgets/app_bar.dart';
import '../../../../mobikul/app_widgets/app_text_field.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_string_constants.dart';
import '../../../mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';

class SellerOrdersFilterSheet extends StatefulWidget {
  const SellerOrdersFilterSheet(this.orderStatusData, {Key? key})
      : super(key: key);

  final List<OrderStatusData>? orderStatusData;

  @override
  _SellerOrdersFilterSheetState createState() => _SellerOrdersFilterSheetState();
}

class _SellerOrdersFilterSheetState extends State<SellerOrdersFilterSheet> {
  late GlobalKey<FormState> _formKey;

  // Controller
  late final TextEditingController _orderIdController =
      TextEditingController(text: "");
  late final TextEditingController _fromDateController =
      TextEditingController(text: "");
  late final TextEditingController _toDateController =
      TextEditingController(text: "");

  List<OrderStatusData>? orderStatusData;
  OrderStatusData? filterOrderStatus;
  String? _selectedStatus;

  void _clearAll() {
    setState(() {
      _orderIdController.clear();
      _fromDateController.clear();
      _toDateController.clear();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    orderStatusData = widget.orderStatusData;
    // var orderStatus = widget.orderStatusData![0];
    // filterOrderStatus = orderStatus;
    _selectedStatus = "";
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }


  Widget _buildUI() {
    return Scaffold(
        appBar: commonAppBar(MpStringConstants.filters, context,
            isElevated: false, isLeadingEnable: true, onPressed: () {
              Navigator.pop(context);
            }, actions: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: ElevatedButton(
                  onPressed: _clearAll,
                  child: const Text(
                    MpStringConstants.clearAll,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:/* Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(*/
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Theme.of(context).cardColor,
                          child: ExpansionTile(
                              initiallyExpanded: true,
                              // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                              title: Text(
                                  Utils.getStringValue(context,
                                      MpStringConstants.orderSearch)
                                      .toUpperCase() ??
                                      '',
                                  style: Theme.of(context).textTheme.titleLarge),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppSizes.spacingNormal,
                                      right: AppSizes.spacingNormal),
                                  child: AppTextField(
                                      controller: _orderIdController,
                                      hintText: Utils.getStringValue(context,
                                          MpStringConstants.orderId) ??
                                          '',
                                      isPassword: false),
                                ),
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
                                  Utils.getStringValue(context,
                                      MpStringConstants.transactionDate)
                                      .toUpperCase() ??
                                      '',
                                  style: Theme.of(context).textTheme.titleLarge),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppSizes.spacingNormal,
                                      right: AppSizes.spacingNormal),
                                  child: AppTextField(
                                      controller: _orderIdController,
                                      hintText: Utils.getStringValue(context,
                                          MpStringConstants.fromDate) ??
                                          '',
                                      isPassword: false),
                                ),
                                const SizedBox(height: 15.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppSizes.spacingNormal,
                                      right: AppSizes.spacingNormal),
                                  child: AppTextField(
                                      controller: _orderIdController,
                                      hintText: Utils.getStringValue(context,
                                          MpStringConstants.toDate) ??
                                          '',
                                      isPassword: false),
                                ),
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
                                  Utils.getStringValue(context,
                                      MpStringConstants.orderStatus)
                                      .toUpperCase() ??
                                      '',
                                  style: Theme.of(context).textTheme.titleLarge),
                              children: [
                                // orderStatusSpinner(widget.orderStatusData,filterOrderStatus),
                                const SizedBox(height: 15.0),
                              ]),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          height: 48,
                          width: AppSizes.deviceWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppSizes.spacingNormal, right: AppSizes.spacingNormal),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child:  Text(
                                MpStringConstants.apply,
                                style: TextStyle(color:Theme.of(context).textTheme?.labelLarge?.color),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  // ),
                //   Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       bottomOrderFilterCancelButton(context, orderStatusData!)
                //
                //     ],
                //   ),
                // ])

        ));

  }
}
