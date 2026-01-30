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
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';

class AddNewProductItemCard extends StatefulWidget {
  final SelectProductsMpModel selectProductsMpModel;
  final int index;
  final checkedList;
  const AddNewProductItemCard(
    this.selectProductsMpModel,
    this.index,
    this.checkedList, {
    super.key,
  });

  @override
  State<AddNewProductItemCard> createState() => _AddNewProductItemCardState();
}

class _AddNewProductItemCardState extends State<AddNewProductItemCard> {
  List listOfSelectedItem = [];
  List<ProductCollectionData> itemlist = [];
  List finalList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                        width: AppSizes.deviceWidth / 4,
                        height: AppSizes.deviceWidth / 4,
                        child: ImageView(
                          isBottomPadding: false,
                          borderRadius: BorderRadius.circular(5.0),
                          url: widget
                                  .selectProductsMpModel
                                  .productCollectionData?[widget.index]
                                  .thumbnail ??
                              '',
                        )),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget
                                    .selectProductsMpModel
                                    .productCollectionData?[widget.index]
                                    .name ??
                                '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget
                                    .selectProductsMpModel
                                    .productCollectionData?[widget.index]
                                    .price ??
                                '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                Utils.getStringValue(
                                    context, MpStringConstants.attributeSet),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                ':',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                widget
                                        .selectProductsMpModel
                                        .productCollectionData?[widget.index]
                                        .attrinuteSet ??
                                    '',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                Utils.getStringValue(
                                    context, MpStringConstants.status),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                ':',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                widget
                                        .selectProductsMpModel
                                        .productCollectionData?[widget.index]
                                        .status ??
                                    '',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                Utils.getStringValue(
                                    context, MpStringConstants.type),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                ':',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                widget
                                        .selectProductsMpModel
                                        .productCollectionData?[widget.index]
                                        .type ??
                                    '',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Utils.getStringValue(
                                    context, MpStringConstants.sku),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                ':',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  widget
                                          .selectProductsMpModel
                                          .productCollectionData?[widget.index]
                                          .sku ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Checkbox(
                  value: widget.checkedList[widget.index],
                  onChanged: (newValue) {
                    setState(() {
                      widget.checkedList[widget.index] = newValue;
                      itemlist =
                          widget.selectProductsMpModel.productCollectionData!;
                      if (widget.checkedList[widget.index] == true) {
                        if (listOfSelectedItem.contains(itemlist)) {
                          listOfSelectedItem.remove(itemlist);
                        } else {
                          listOfSelectedItem.add(itemlist);
                        }
                      }
                      finalList.addAll(listOfSelectedItem);
                      print("list...............");
                      print(listOfSelectedItem);
                      print("**********");
                      print(finalList.length);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleItemSelection(String item) {
    if (listOfSelectedItem.contains(item)) {
      listOfSelectedItem.remove(item);
    } else {
      listOfSelectedItem.add(item);
    }
  }
}
