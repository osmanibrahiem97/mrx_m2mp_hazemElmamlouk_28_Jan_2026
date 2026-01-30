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

import 'package:json_annotation/json_annotation.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/attributes_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/option_prices_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/prices_model.dart';
part 'configurable_data_model.g.dart';

@JsonSerializable()
class ConfigurableData {
  List<Attributes>? attributes;
  String? template;
  List<OptionPrices>? optionPrices;
  Prices? prices;
  String? productId;
  String? chooseText;
  String? images;
  String? index;
  String? swatchData;

  ConfigurableData(
      {this.attributes,
      this.template,
      this.optionPrices,
      this.prices,
      this.productId,
      this.chooseText,
      this.images,
      this.index,
      this.swatchData});

  factory ConfigurableData.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableDataToJson(this);
}
