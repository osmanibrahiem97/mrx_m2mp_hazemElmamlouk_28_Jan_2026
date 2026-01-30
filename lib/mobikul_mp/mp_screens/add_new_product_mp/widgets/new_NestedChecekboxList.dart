/*
* Webkul Software.
*
@package Mobikul Application Code.
* @Category Mobikul
* @author Webkul <support@webkul.com>
* @Copyright (c) Webkul Software Private Limited (https://webkul.com)
* @license https://store.webkul.com/license.html
* @link https://store.webkul.com/license.html
*
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../mobikul/app_widgets/app_bar.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/constants/app_string_constant.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_string_constants.dart';
import '../../../mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';

class NewNestedCheckboxList extends StatefulWidget {
  final List<AssignedCategory> categories;
  List<Map<String, dynamic>>? selectedCategoryList;

  void Function(List<Map<String, dynamic>> selected)? onSelected;

  NewNestedCheckboxList({super.key, required this.categories, this.onSelected, this.selectedCategoryList});
  @override
  _NewNestedCheckboxListState createState() => _NewNestedCheckboxListState();
}

class _NewNestedCheckboxListState extends State<NewNestedCheckboxList> {
  List<AssignedCategory> mCategoryList = [];

  List<Map<String, dynamic>> updateSelectedItems(AssignedCategory item) {

    bool k =  widget.selectedCategoryList?.where((element) => element['id'] == item.id).toList().isNotEmpty ?? false;

    if(k){
      print('++++++++ if condition list contains item ');
      widget.selectedCategoryList?.removeWhere((element) => element['id'] == item.id);
    }else{
      print('++++++++ else condition list not contains item ');
      var res = {
        "id": item.id ?? '',
        "name": item.name ?? '',
      };
      widget.selectedCategoryList?.add(res);
    }


    //List<Categories> selectedItems = [];
    // _getSelectedItems(mCategoryList, selectedItems);
    //
    List<Map<String, dynamic>> selectedCategoryList = [];
    // selectedItems.forEach((item) {
    //   var res = {
    //     "categoryId": item.categoryId ?? '',
    //     "categoryTitle": item.name ?? '',
    //   };
    //   widget.selectedCategoryList?.add(res);
    //   print('Selected Item: ${item.name}');
    // });
    return selectedCategoryList;
  }

  void _getSelectedItems(
      List<AssignedCategory> itemList, List<AssignedCategory> selectedItems) {
    for (var item in itemList) {
      if (item.isChecked == true) {
        selectedItems.add(item);
      }
      if (item.children != null) {
        if (item.children!.isNotEmpty) {
          _getSelectedItems(item.children!, selectedItems);
        } }
    }
  }

  Widget _buildNestedCheckboxList(List<AssignedCategory> itemList) {
    print("Data----${widget.categories}");

    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          AssignedCategory item = itemList[index];
          bool k1 = false;

          var k =  widget.selectedCategoryList?.where((element) => element['id'] == item.id).toList().isNotEmpty;


          return Column(
            children: [
              CheckboxListTile(
                title: Text(item.name ?? ''),
                value: k?? false,//item.isChecked ?? false,
                onChanged: (value) {
                  setState(() {
                    item.isChecked = value!;
                    updateSelectedItems(item);
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (item.children != null)...[
                if (item.children!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildNestedCheckboxList(item.children!),
                  )],
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mCategoryList = widget.categories;

    if(widget.selectedCategoryList?.isNotEmpty ?? false){
      print('+++++++ mCategories list length is ${widget.selectedCategoryList?[0]['categoryId']}'); }
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
                    widget.onSelected!(widget.selectedCategoryList ??[]
                      //updateSelectedItems()
                    );
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