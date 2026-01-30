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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_multi_select_checkbox.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/common_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/models/search/advance_search_model.dart';
import 'package:test_new/mobikul/screens/search/advance_search/bloc/advance_search_bloc.dart';
import 'package:test_new/mobikul/screens/search/advance_search/bloc/advance_search_events.dart';
import 'package:test_new/mobikul/screens/search/advance_search/bloc/advance_search_states.dart';

import '../../../helper/app_storage_pref.dart';

class AdvanceSearchScreen extends StatefulWidget {
  AdvanceSearchScreen({Key? key}) : super(key: key);

  @override
  State<AdvanceSearchScreen> createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AppLocalizations? _localizations;
  bool isLoading = false;
  AdvanceSearchModel? advanceSearchModel;
  AdvanceSearchScreenBloc? advanceSearchScreenBloc;

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    advanceSearchScreenBloc = context.read<AdvanceSearchScreenBloc>();
    advanceSearchScreenBloc?.add(InitialAdvanceSearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          _localizations?.translate(AppStringConstant.advanceSearch) ?? '',
          context),
      body: BlocBuilder<AdvanceSearchScreenBloc, AdvanceSearchState>(
        builder: (context, state) {
          if (state is AdvanceSearchLoadingState) {
            isLoading = true;
          } else if (state is AdvanceSearchScreenSuccess) {
            isLoading = false;
            advanceSearchModel = state.advanceSearchModel;
          } else if (state is AdvanceSearchScreenError) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }

          return _buildUI();
        },
      ),
    );
  }

  Widget _buildUI() {
    return Stack(
      children: [
        Visibility(
            visible: advanceSearchModel?.fieldList?.isNotEmpty ?? false,
            child: _addEditAddressForm()),
        Visibility(visible: isLoading, child: const Loader()),
      ],
    );
  }

  Widget _addEditAddressForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.size12),
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.size8),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: _getTextField(),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.size8, vertical: AppSizes.size8),
            child: commonButton(context, () {
              _formKey.currentState?.save();

              bool hasValue = false;
              List<Map<String, String>> printData = [];

              advanceSearchModel?.fieldList?.forEach((element) {
                if (element.value != null && element.value.toString().isNotEmpty) {
                  if (element.value is Map) {
                    if (element.value['from']?.isNotEmpty == true ||
                        element.value['to']?.isNotEmpty == true) {
                      hasValue = true;
                    }
                  } else {
                    hasValue = true;
                  }

                  // Add to printData if has value
                  if (element.value is Map) {
                    if (element.value['from']?.isNotEmpty == true ||
                        element.value['to']?.isNotEmpty == true) {
                      print("if element value : ${element.value}");
                      final from = element.value['from'];
                      final to = element.value['to'];

                      // Only pass non-empty values
                      String value;
                      if (from?.isNotEmpty == true && to?.isNotEmpty == true) {
                        value = '"$from-$to"';          // e.g., "5-20"
                      } else if (from?.isNotEmpty == true) {
                        value = "$from";              // only from
                      } else {
                        value = "$to";                // only to
                      }
                      printData.add(
                          {"code": element.attributeCode.toString(), "value": value});
                    }
                  } else {
                    print("else element value : ${element.value}");
                    printData.add(
                        {"code": element.attributeCode.toString(), "value": '"${element.value}"'});
                  }
                }
              });

              if (hasValue) {
                print("Please all data print");
                print("Print Data List : $printData");
                String productName = "";
                for (var item in printData) {
                  if (item["code"] == "name") {
                    productName = item["value"].toString();
                    break;
                  }
                }

                // Proceed with search logic if needed
                Navigator.pushNamed(context, AppRoutes.catalog,
                    arguments: getCatalogMap(
                      "",
                      "",
                      BUNDLE_KEY_CATALOG_TYPE_SEARCH,
                      false,
                      searchData: printData,
                    ));
              } else {
                AlertMessage.showError("Please enter at least one field", context);
              }
            },
                (_localizations?.translate(AppStringConstant.search) ?? '')
                    .toUpperCase(),
                width: AppSizes.deviceWidth,
                backgroundColor: AppColors.black,
                textColor: AppColors.white),
          )
        ]),
      ),
    );
  }

  List<Widget> _getTextField() {
    List<Widget> columnChildren = <Widget>[];

    advanceSearchModel?.fieldList?.forEach((element) {
      if (element.inputType == "select") {
        columnChildren.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.size8),
              child: Text(
                element.label ?? '',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            CheckboxGroup(
              labels: element.options?.map((e) => e.label ?? '').toList() ?? [],
              checked: element.options
                      ?.where((element) => element.isSelected == true)
                      .map((e) => e.label ?? '')
                      .toList() ??
                  [],
              onChange: (bool isChecked, String label, int index, Key? key) {},
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ));
      } else if (element.attributeCode == "price") {
        columnChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.label ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        hintText: "",
                        isPassword: false,
                        onSave: (value) {
                          if (element.value == null || element.value is! Map) {
                            element.value = {};
                          }
                          element.value['from'] = value;
                        },
                        inputType: TextInputType.number,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("-",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: AppTextField(
                        hintText: "",
                        isPassword: false,
                        onSave: (value) {
                          if (element.value == null || element.value is! Map) {
                            element.value = {};
                          }
                          element.value['to'] = value;
                        },
                        inputType: TextInputType.number,
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(appStoragePref.getCurrencyCode(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        columnChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: AppTextField(
              hintText: element.label,
              isPassword: false,
              onSave: (value) {
                element.value = value;
              },
              inputType: TextInputType.text,
            ),
          ),
        );
      }
    });
    return columnChildren;
  }
}

// void _validateForm() async {
//   if (_formKey.currentState?.validate() == true) {
//     Map<String, dynamic> data = Map();
//     addressFormModel?.addressFields?.field?.forEach((element) {
//       data[element.fieldName ?? ''] = element.value;
//     });
//     data["id_country"] == null
//         ? data["id_country"] = countries?.first.idCountry
//         : data["id_country"];
//     data['id_address'] = widget.addressId;
//     data['id_customer'] = await AppSharedPref.getCustomerId();
//     addEditBloc?.add(const LoadingEvent());
//     addEditBloc?.add(SaveAddressEvent(data: data));
//     return;
//   }
// }
