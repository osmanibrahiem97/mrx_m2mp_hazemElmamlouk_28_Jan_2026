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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import '../../../mp_models/add_new_product_mp_model/categories.dart';
import '../../../mp_widgets/check_box_group.dart';

class SelectCategory extends StatefulWidget {
  final AddNewProductMpModel addNewProductMpModel;
  SelectCategory({Key? key, required this.addNewProductMpModel})
      : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        Utils.getStringValue(context, MpStringConstants.selectCategory),
        context,
        isLeadingEnable: true,
        leadingIcon: Icons.arrow_back,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child:
            // CheckboxGroupMp(
            //   category: widget.addNewProductMpModel?.categories.children ?? [],
            // ),
            CheckboxGroupMp(
          // labels: element.options?.map((e) => e.label ?? '').toList() ?? [],
          // checked:  List<bool>.filled(
          //     widget.addNewProductMpModel.categories.children.length ?? 0, widget.category?[i].isChecked ?? false);
          activeColor: Theme.of(context).colorScheme.primary,
          category: widget.addNewProductMpModel.categories?.children ?? [],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        // height: AppSizes.genericButtonHeight + 5,
        child: SizedBox(
          height: AppSizes.genericButtonHeight,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ElevatedButton(
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "Select Category",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget categoryView(List<Categories> categories) {
    return ListView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CheckboxGroupMp(
          category: categories,
        );
      },
    );
  }
}
