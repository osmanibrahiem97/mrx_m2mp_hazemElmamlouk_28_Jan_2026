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

import 'package:equatable/equatable.dart';

abstract class SelectProductsMpEvent extends Equatable {
  const SelectProductsMpEvent();

  @override
  List<Object> get props => [];
}

class SelectProductsMpFetchEvent extends SelectProductsMpEvent {
  int pageNumber;
  String pageType;
  int width;
  String filterData;
  String sortData;
  int onlySelected;
  int productId;
  SelectProductsMpFetchEvent(
      {required this.pageNumber,
      required this.pageType,
      required this.width,
      required this.filterData,
      required this.sortData,
      required this.onlySelected,
      required this.productId});
}
