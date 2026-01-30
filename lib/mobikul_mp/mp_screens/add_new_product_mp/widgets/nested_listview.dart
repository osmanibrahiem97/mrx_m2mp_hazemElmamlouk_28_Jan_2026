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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/categories.dart';

class NestedCheckboxList extends StatefulWidget {
  final Categories categories;

  void Function(List<Map<String, dynamic>> selected)? onSelected;

  NestedCheckboxList({super.key, required this.categories, this.onSelected});
  @override
  _NestedCheckboxListState createState() => _NestedCheckboxListState();
}

class _NestedCheckboxListState extends State<NestedCheckboxList> {
  List<Categories> mCategoryList = [];

  List<Map<String, dynamic>> updateSelectedItems() {
    List<Categories> selectedItems = [];
    _getSelectedItems(mCategoryList, selectedItems);

    List<Map<String, dynamic>> selectedCategoryList = [];
    selectedItems.forEach((item) {
      var res = {
        "categoryId": item.categoryId ?? '',
        "categoryTitle": item.name ?? '',
      };
      selectedCategoryList.add(res);
      print('Selected Item: ${item.name}');
    });
    return selectedCategoryList;
  }

  void _getSelectedItems(
      List<Categories> itemList, List<Categories> selectedItems) {
    for (var item in itemList) {
      if (item.isChecked == true) {
        selectedItems.add(item);
      }
      if (item.children!.isNotEmpty) {
        _getSelectedItems(item.children!, selectedItems);
      }
    }
  }

  Widget _buildNestedCheckboxList(List<Categories> itemList) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          Categories item = itemList[index];
          return Column(
            children: [
              CheckboxListTile(
                title: Text(item.name ?? ''),
                value: item.isChecked ?? false,
                onChanged: (value) {
                  setState(() {
                    item.isChecked = value!;
                    updateSelectedItems();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (item.children!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildNestedCheckboxList(item.children!),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mCategoryList = widget.categories.children!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.selectCategory),
          context,
          isLeadingEnable: false, onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          Expanded(child: _buildNestedCheckboxList(mCategoryList)),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: SizedBox(
              height: AppSizes.genericButtonHeight,
              width: AppSizes.deviceWidth,
              child: ElevatedButton(
                child: Text(
                  Utils.getStringValue(context, AppStringConstant.submit),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  if (widget.onSelected != null) {
                    widget.onSelected!(updateSelectedItems());
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
