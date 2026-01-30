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

import '../base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'flag_reasons.dart';
part 'product_flags.g.dart';

@JsonSerializable()
class ProductFlags extends BaseModel {

  String? text;
  bool? guestCanFlag;
  bool? reason;
  bool? acceptOtherReasons;
  String? otherFieldPlaceholder;
  List<FlagReasons>? flagReasons;

  ProductFlags(this.text,
      this.guestCanFlag,
      this.reason,
      this.acceptOtherReasons,this.otherFieldPlaceholder,this.flagReasons);

  factory ProductFlags.fromJson(Map<String, dynamic> json) =>
      _$ProductFlagsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFlagsToJson(this);
}

