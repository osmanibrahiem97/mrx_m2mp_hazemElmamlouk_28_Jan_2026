
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

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

import '../../../mobikul_mp/mp_models/add_new_product_mp_model/add_another_link/file_data_model.dart';
import '../../../mobikul_mp/mp_models/add_new_product_mp_model/add_another_link/sample_data.dart';
part 'link_data.g.dart';

@JsonSerializable()
class LinkData{
  @JsonKey(name: "link_id")
  int? id;
  @JsonKey(name:"id")
  dynamic? linkId;
  @JsonKey(name: "title")
  String? linkTitle;
  String? price;
  String? formattedPrice;
  @JsonKey(name: "type")
  String? linkType;
  @JsonKey(name: "link_url")
  String? url;
  @JsonKey(name: "file")
  List<FileModel>? file;
  @JsonKey(name: "is_shareable")
  String? isShareable;
  @JsonKey(name: "sample")
  SampleDataModel? sample;

  // @JsonKey(name: "sample_url")
  // String? linkSampleTitle;
  // @JsonKey(name:"is_shareable")
  // String? isShareable;
  // @JsonKey(name: "sample_type")
  // String? sampleType;
  // @JsonKey(name: "sample_file")
  // String? sampleFile;
  @JsonKey(name: "number_of_downloads")
  int? isDownloadable;

  LinkData(this.id, this.linkTitle, this.price, this.formattedPrice, this.url,this.isShareable,this.isDownloadable,this.sample,this.file,this.linkType,this.linkId);

  factory LinkData.fromJson(Map<String, dynamic> json) =>
      _$LinkDataFromJson(json);

  Map<String, dynamic> toJson() => _$LinkDataToJson(this);


}