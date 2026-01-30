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
import 'package:intl/intl.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/configuration/mobikul_theme.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

class SellerProductFilterSheet extends StatefulWidget {
  const SellerProductFilterSheet({Key? key}) : super(key: key);

  @override
  _SellerProductFilterSheetState createState() =>
      _SellerProductFilterSheetState();
}

class _SellerProductFilterSheetState extends State<SellerProductFilterSheet> {
  // Controller
  TextEditingController productNameController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  late DateTime _selectedDate;

  //For now
  var statusOption = [
    'All',
    'Enabled',
    'Disabled',
  ];

  void _clearAll() {
    setState(() {
      productNameController.clear();
      fromDateController.clear();
      toDateController.clear();
    });
  }

  @override
  void initState() {
    _selectedDate = DateTime.now();
    super.initState();
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
              child: SizedBox(
                width: AppSizes.deviceWidth / 4,
                child: appOutlinedButton(context, () {
                  _clearAll();
                },
                    Utils.getStringValue(context, MpStringConstants.clearAll) ??
                        ''),
              ))
        ]),
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                      initiallyExpanded: true,
                      // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                      title: Text(
                          Utils.getStringValue(
                                      context, MpStringConstants.searchProduct)
                                  .toUpperCase() ??
                              '',
                          style: Theme.of(context).textTheme.titleLarge),
                      children: [
                        AppTextField(
                            controller: productNameController,
                            hintText: Utils.getStringValue(
                                    context, MpStringConstants.transactionId) ??
                                '',
                            isPassword: false),
                        const SizedBox(height: 15.0),
                      ]),
                  ExpansionTile(
                      initiallyExpanded: true,
                      // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                      title: Text(
                          Utils.getStringValue(context,
                                      MpStringConstants.productCreationDate)
                                  .toUpperCase() ??
                              '',
                          style: Theme.of(context).textTheme.titleLarge),
                      children: [
                        InkWell(
                          onTap: () {
                            selectFromDateSheet(context);
                          },
                          child: AppTextField(
                            controller: fromDateController,
                            hintText: Utils.getStringValue(
                                    context, MpStringConstants.fromDate) ??
                                '',
                            isPassword: false,
                            enable: false,
                            suffix: const Icon(Icons.date_range),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            selectToDateSheet(context);
                          },
                          child: AppTextField(
                            controller: toDateController,
                            hintText: Utils.getStringValue(
                                    context, MpStringConstants.fromDate) ??
                                '',
                            isPassword: false,
                            enable: false,
                            suffix: const Icon(Icons.date_range),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 15.0),
                  ExpansionTile(
                      initiallyExpanded: true,
                      // initiallyExpanded: (widget.description ?? '') != "" ? true : false,
                      title: Text(
                          Utils.getStringValue(
                                      context, MpStringConstants.productStatus)
                                  .toUpperCase() ??
                              '',
                          style: Theme.of(context).textTheme.titleLarge),
                      children: [
                        DropdownButtonFormField<String>(
                          elevation: 0,
                          menuMaxHeight: AppSizes.deviceHeight / 2,
                          hint: Text(
                            'All',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          decoration: formFieldDecoration(context, "", '',
                              isDense: true, isRequired: true),
                          items: (statusOption ?? []).map((String optionData) {
                            return DropdownMenuItem(
                              value: optionData,
                              child: Text(
                                optionData ?? "",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // this will call once the value changes
                            // accountInfoModel?.gender = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null) {
                              // if ((accountInfoModel?.isGenderVisible ?? false) &&
                              //     (accountInfoModel?.isGenderRequired ?? false))
                              return Utils.getStringValue(
                                  context, AppStringConstant.required);
                            }
                          },
                        ),
                      ]),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    height: 48,
                    width: AppSizes.deviceWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _apply();
                      },
                      child: Text(
                        Utils.getStringValue(
                                context, MpStringConstants.apply) ??
                            '',
                        style:  TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Select FromDate
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
        fromDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  //Select ToDate
  void selectToDateSheet(BuildContext context) async {
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
        toDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  //Apply Button
  void _apply() {}
}
