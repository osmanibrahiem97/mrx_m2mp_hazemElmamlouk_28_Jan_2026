
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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/attribute_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/options_price_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/price_mp_model.dart';
part 'configure_data_mp_model.g.dart';

@JsonSerializable()
class ConfigureDataMpModel {
  List<AttributeMpModel>? attributes;
  String? template;
  List<OptionPriceMpModel>? optionPrices;
  PricesMpModel? prices;
  String? productId;
  String? chooseText;
  String? images;
  String? index;
  String? swatchData;

  ConfigureDataMpModel(
      {this.attributes,
        this.template,
        this.optionPrices,
        this.prices,
        this.productId,
        this.chooseText,
        this.images,
        this.index,
        this.swatchData});

  factory ConfigureDataMpModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigureDataMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigureDataMpModelToJson(this);
}