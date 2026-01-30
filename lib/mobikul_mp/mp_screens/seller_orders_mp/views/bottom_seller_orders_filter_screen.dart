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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/configuration/mobikul_theme.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

import '../../../mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';

class BottomSellerOrdersFilterScreen extends StatefulWidget {
  BottomSellerOrdersFilterScreen(this.onFilter, this.orderStatusData, this.transactionFilterData,
      {Key? key})
      : super(key: key);

  var orderStatusData;
  var transactionFilterData;

  final Function(Map<String, String>) onFilter;

  @override
  _BottomSellerOrdersFilterScreenState createState() =>
      _BottomSellerOrdersFilterScreenState();
}

class _BottomSellerOrdersFilterScreenState
    extends State<BottomSellerOrdersFilterScreen> {

  // Controller
  late final TextEditingController _orderIdController =
  TextEditingController(text: "");
  late final TextEditingController _fromDateController =
  TextEditingController(text: "");
  late final TextEditingController _toDateController =
  TextEditingController(text: "");
  late TextEditingController _statusController =
  TextEditingController(text: "");
  late DateTime _selectedDate;
  bool isVisibleOrderStatusData = false;

  List<OrderStatusData>? orderStatusData;
  String? _selectedStatus;

  void _clearAll() {
    setState(() {
      _orderIdController.text = "";
      _fromDateController.text = "";
      _toDateController.text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    orderStatusData = widget.orderStatusData ?? [];
    _selectedStatus = "canceled";
    // _selectedStatus = orderStatusData?.first.status ?? "canceled";


    // if (orderStatusData != null && (orderStatusData?.length ?? 0) > 0) {
    //   isVisibleOrderStatusData = true;
    // } else {
    //   isVisibleOrderStatusData = false;
    // }

    if (widget.transactionFilterData != null) {
      _orderIdController.text =
          widget.transactionFilterData["orderId"] ?? '';
      _fromDateController.text = widget.transactionFilterData["fromDate"] ?? '';
      _toDateController.text = widget.transactionFilterData["toDate"] ?? '';
      // _selectedStatus = widget.transactionFilterData["status"] ?? orderStatusData?.first.status;
      _selectedStatus = widget.transactionFilterData["status"] ?? "canceled";

      print("Selected Status Data initState() $_selectedStatus  ${widget.transactionFilterData["status"]}   ${orderStatusData?.first.status}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: commonAppBar(
                Utils.getStringValue(context, MpStringConstants.filters) ?? '',
                context,
                isElevated: false,
                isLeadingEnable: true, onPressed: () {
              Navigator.pop(context);
            }, actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 13.0),
                  child: SizedBox(
                    width: AppSizes.deviceWidth / 4,
                    child: appOutlinedButton(context, () {
                      _clearAll();
                    },
                        Utils.getStringValue(
                            context, MpStringConstants.clearAll) ??
                            ''),
                  ))
            ]),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: /* Column(
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
                            Utils.getStringValue(
                                context, MpStringConstants.orderSearch)
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
                                hintText: Utils.getStringValue(
                                    context, MpStringConstants.orderId) ??
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
                            child: InkWell(
                              onTap: () {
                                selectFromDateSheet(context);
                              },
                              child: AppTextField(
                                controller: _fromDateController,
                                hintText: Utils.getStringValue(
                                    context, MpStringConstants.fromDate) ??
                                    '',
                                isPassword: false,
                                enable: false,
                                suffix: const Icon(Icons.date_range),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppSizes.spacingNormal,
                                right: AppSizes.spacingNormal),
                            child: InkWell(
                              onTap: () {
                                selectToDateSheet(context);
                              },
                              child: AppTextField(
                                controller: _toDateController,
                                hintText: Utils.getStringValue(
                                    context, MpStringConstants.toDate) ??
                                    '',
                                isPassword: false,
                                enable: false,
                                suffix: const Icon(Icons.date_range),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ]),
                  ),
                  const SizedBox(height: 15.0),
                  // Container(
                  //   color: Theme.of(context).cardColor,
                  //   child: ExpansionTile(
                  //       initiallyExpanded: true,
                  //       // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                  //       title: Text(
                  //           Utils.getStringValue(
                  //                       context, MpStringConstants.orderStatus)
                  //                   .toUpperCase() ??
                  //               '',
                  //           style: Theme.of(context).textTheme.subtitle1),
                  //       children: [
                  //         Container(
                  //           color: Theme.of(context).cardColor,
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(
                  //                 left: AppSizes.spacingNormal,
                  //                 right: AppSizes.spacingNormal),
                  //             child: Column(
                  //               children: [
                  //                 const SizedBox(height: AppSizes.size16),
                  //                 Visibility(
                  //                   visible: isVisibleOrderStatusData,
                  //                   child: CommonDropDownField(
                  //                     value: _selectedStatus,
                  //                     // itemList: getStatusStrings(),
                  //                     itemList: getStatusStrings(),
                  //                     hintText: Utils.getStringValue(context,
                  //                         MpStringConstants.orderStatus),
                  //                     key: const Key('status'),
                  //                     callBack: dropdownUpdate,
                  //                     // dropdownUpdate,
                  //                   ),
                  //                 ),
                  //                 Visibility(
                  //                   visible: isVisibleOrderStatusData,
                  //                   child: Container(),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10.0),
                  //       ]),
                  // ),
                  // const SizedBox(height: 20.0),
                  SizedBox(
                    height: 48,
                    width: AppSizes.deviceWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: AppSizes.spacingNormal,
                          right: AppSizes.spacingNormal),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _apply();
                        },
                        child: Text(
                          (MpStringConstants.apply),
                          style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  void dropdownUpdate(String item, Key? key) {
    _selectedStatus = item ?? '';

    print('Selected Order Status   $item  ');
    setState(() {});
  }

  //Select From Date
  void selectFromDateSheet(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: MobikulTheme.accentColor,
              ),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.black, elevation: 3,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      textStyle: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))),
            ),
            child: child!,
          );
        });

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _fromDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
        _toDateController.text = "";
      });
    }
  }

  // SElect To Date
  void selectToDateSheet(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _selectedDate,
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: MobikulTheme.accentColor,
              ),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.black, elevation: 3,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      textStyle: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))),
            ),
            child: child!,
          );
        });
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _toDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  //Apply Button
  void _apply() {
    print(
        "FILTER_DATA ===> ${_orderIdController.text}   ${_fromDateController.text}  ${_toDateController.text}   $_selectedStatus");
    Map<String, String> filterData = {};
    filterData["orderId"] = _orderIdController.text;
    filterData["fromDate"] = _fromDateController.text;
    filterData["toDate"] = _toDateController.text;
    // filterData["status"] = _selectedStatus!;
    print("TEST LOG FILTERDATA STATUS ${filterData["orderId"]}");
    print("TEST LOG _selectedStatus => ${_selectedStatus}");
    widget.onFilter(filterData);
  }

/*  List<String> getStatusStrings(*//*List<OrderStatusData>? orderStatusData*//*) {
    List<String> status = [];
    if (orderStatusData != null) {
      status.add("Select Status...");

      for (OrderStatusData item in orderStatusData ?? []) {
        print("DropDownData ${item.status}");
        if (item.status != null) {
          status.add(item.status ?? "");
        } *//*else {
          status.add("Select Status...");
        }*//*
      }
    }
    return status;
  }*/

  List<String> getStatusStrings() {
    List<String> status = [];
    if (orderStatusData != null) {
      for (OrderStatusData item in orderStatusData ?? []) {
        if (item.status != null) {
          status.add(item.status ?? "");
        } else {
          status.add("Select Status...");
        }
      }
    }
    return status;
  }

}
