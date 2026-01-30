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
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import '../../../mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';
import 'selected_product_card_element_view.dart';

class SelectedProductCard extends StatefulWidget {
  const SelectedProductCard({
    super.key,
    required this.selectedCrossSellItemList,
    required this.index,
  });

  final List<ProductCollectionData> selectedCrossSellItemList;
  final int index;

  @override
  State<SelectedProductCard> createState() => _SelectedProductCardState();
}

class _SelectedProductCardState extends State<SelectedProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: AppSizes.deviceWidth / 4,
                      height: AppSizes.deviceWidth / 4,
                      child: ImageView(
                        isBottomPadding: false,
                        borderRadius: BorderRadius.circular(5.0),
                        url: widget.selectedCrossSellItemList[widget.index]
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
                        SizedBox(
                          width: 180,
                          child: Text(
                            widget.selectedCrossSellItemList[widget.index]
                                    .name ??
                                '',
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.selectedCrossSellItemList[widget.index]
                                  .price ??
                              '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SelectedProductCardElementView(
                          selectedCrossSellItemList:
                              widget.selectedCrossSellItemList,
                          index: widget.index,
                          title: MpStringConstants.attributeSet,
                          value: widget.selectedCrossSellItemList[widget.index]
                                  .attrinuteSet ??
                              '',
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SelectedProductCardElementView(
                          selectedCrossSellItemList:
                              widget.selectedCrossSellItemList,
                          index: widget.index,
                          title: MpStringConstants.status,
                          value: widget.selectedCrossSellItemList[widget.index]
                                  .status ??
                              '',
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SelectedProductCardElementView(
                          selectedCrossSellItemList:
                              widget.selectedCrossSellItemList,
                          index: widget.index,
                          title: MpStringConstants.type,
                          value: widget.selectedCrossSellItemList[widget.index]
                                  .type ??
                              '',
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SelectedProductCardElementView(
                          selectedCrossSellItemList:
                              widget.selectedCrossSellItemList,
                          index: widget.index,
                          title: MpStringConstants.sku,
                          value: widget.selectedCrossSellItemList[widget.index]
                                  .sku ??
                              '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                    onTap: () {
                      // setState(() {
                      //   addNewProductMpModel
                      //       ?.productData?.mediaGallery
                      //       ?.removeAt(index);
                      // });
                      setState(() {
                        widget.selectedCrossSellItemList.removeAt(widget.index);
                      });
                      if (kDebugMode) {
                        print(
                            "TEST LOG ::: selectedCrossSellItemList length => ${widget.selectedCrossSellItemList.length}");
                      }
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(Utils.getStringValue(
                              context, AppStringConstant.remove)),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
