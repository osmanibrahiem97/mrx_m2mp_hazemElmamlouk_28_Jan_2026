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


import 'package:json_annotation/json_annotation.dart';

import '../base_model.dart';


part 'download_invoice_model.g.dart';

@JsonSerializable()
class DownloadInvoiceModel extends BaseModel{

  @JsonKey(name: "url")
  String? url;

  DownloadInvoiceModel(
      this.url);


  factory DownloadInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadInvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadInvoiceModelToJson(this);

}