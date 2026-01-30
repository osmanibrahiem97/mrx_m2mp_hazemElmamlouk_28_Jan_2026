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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';

class SelectedProductCardElementView extends StatelessWidget {
  const SelectedProductCardElementView({
    super.key,
    required this.selectedCrossSellItemList,
    required this.index,
    required this.title,
    required this.value,
  });

  final List<ProductCollectionData> selectedCrossSellItemList;
  final int index;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            Utils.getStringValue(context, title),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          width: 3.0,
        ),
        Expanded(
          flex: 1,
          child: Text(
            ':',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}