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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

class CustomerFilterSheet extends StatefulWidget {
  var customerMpBloc;
  var customerFilterData;

  ValueChanged<Map<String, dynamic>>? callBack;
  CustomerFilterSheet(
      {Key? key, this.customerMpBloc, this.callBack, this.customerFilterData})
      : super(key: key);

  @override
  _CustomerFilterSheetState createState() => _CustomerFilterSheetState();
}

class _CustomerFilterSheetState extends State<CustomerFilterSheet> {
  // Controller
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailControllerController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //For now
  var genderOption = [
    'Male',
    'Female',
    'Others',
  ];
  String? choosedGender = "";

  void _clearAll() {
    setState(() {
      customerNameController.text = "";
      emailControllerController.text = "";
      contactNumberController.text = "";
      addressController.text = "";
      widget.customerFilterData = "";
      choosedGender = "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.customerFilterData != null) {
      choosedGender = widget.customerFilterData["gender"] ?? '';
      customerNameController.text = widget.customerFilterData["name"] ?? '';
      emailControllerController.text = widget.customerFilterData["email"] ?? '';
      addressController.text = widget.customerFilterData["billingFull"] ?? '';
      contactNumberController.text =
          widget.customerFilterData["billingTelephone"] ?? '';
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                    controller: customerNameController,
                    hintText: MpStringConstants.customerName,
                    isPassword: false),
                const SizedBox(height: 25.0),

                /// Gender
                // if ((accountInfoModel?.isGenderVisible ?? false))
                SizedBox(
                  height: 50,
                  child: DropdownButtonFormField<String>(
                    elevation: 0,
                    menuMaxHeight: AppSizes.deviceHeight / 2,
                    hint: Text(
                      // genderOption[int.parse(
                      //         accountInfoModel?.genderValue ?? "0")] ??
                      Utils.getStringValue(context, AppStringConstant.gender),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    decoration: formFieldDecoration(context, "",
                        Utils.getStringValue(context, AppStringConstant.gender),
                        isDense: true, isRequired: true),
                    items: (genderOption ?? []).map((String optionData) {
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
                      setState(() {
                        choosedGender = value;
                      });
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
                ),
                const SizedBox(height: 15.0),
                AppTextField(
                    controller: emailControllerController,
                    hintText: MpStringConstants.email,
                    isPassword: false),
                const SizedBox(height: 15.0),
                AppTextField(
                    controller: contactNumberController,
                    hintText: MpStringConstants.contactNumber,
                    isPassword: false),
                const SizedBox(height: 15.0),
                AppTextField(
                    controller: addressController,
                    hintText: MpStringConstants.address,
                    isPassword: false),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 48,
                  width: AppSizes.deviceWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> params = Map();

                      params["billingTelephone"] =
                          contactNumberController.text ?? '';
                      params["billingFull"] = addressController.text ?? '';
                      params["gender"] = choosedGender ?? '';
                      params["email"] = emailControllerController.text ?? '';
                      params["name"] = customerNameController.text ?? '';
                      if (widget.callBack != null) {
                        widget.callBack!(params);
                      } else {
                        if (kDebugMode) {
                          print('fill the form');
                        }
                      }
                    },
                    child: Text(
                      Utils.getStringValue(context, MpStringConstants.apply) ??
                          '',
                      style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color),
                    ),
                  ),
                ),
             ],
            ),
          ),
        ),
      ),
    );
  }
}
