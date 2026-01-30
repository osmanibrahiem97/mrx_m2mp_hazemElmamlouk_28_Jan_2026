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

import '../../../../mobikul/models/catalog/request/catalog_product_request.dart';


abstract class CatalogScreenMpEvent extends Equatable {}

class ChangeViewEvent extends CatalogScreenMpEvent {
  final bool isGrid;

  ChangeViewEvent(this.isGrid);

  @override
  List<Object> get props => [];
}

class LoadingEvent extends CatalogScreenMpEvent {
  LoadingEvent();

  @override
  List<Object?> get props => [];
}

class FetchCatalogEvent extends CatalogScreenMpEvent {
  FetchCatalogEvent(this.request);

  final CatalogProductRequest request;

  @override
  List<Object> get props => [request];
}

