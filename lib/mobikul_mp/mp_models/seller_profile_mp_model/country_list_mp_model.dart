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

part 'country_list_mp_model.g.dart';

@JsonSerializable()
class CountryListMpModel {
  String? value;
  String? label;
  bool? isRegionVisible;
  bool? isRegionRequired;
  bool? isZipcodeOptional;
  bool? isDefault;

  CountryListMpModel(
      {this.value,
        this.label,
        this.isRegionVisible,
        this.isRegionRequired,
        this.isZipcodeOptional,
        this.isDefault});

  factory CountryListMpModel.fromJson(Map<String, dynamic> json) =>
      _$CountryListMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListMpModelToJson(this);
}
