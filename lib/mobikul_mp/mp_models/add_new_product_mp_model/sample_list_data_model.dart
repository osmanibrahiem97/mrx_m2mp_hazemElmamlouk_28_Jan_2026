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
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/sample_file_data_model.dart';
part 'sample_list_data_model.g.dart';

@JsonSerializable()
class SamplesDataList  {
  @JsonKey(name:"sample_id")
  String? sampleId;

  @JsonKey(name:"type")
  String? sampleType;

  @JsonKey(name:"sample_url")
  String? sampleUrl;

  @JsonKey(name:"sort_order")
  String? sortOrder;

  @JsonKey(name:"title")
  String? title;

  @JsonKey(name: "file")
  List<SampleFileDataModel>? file;

  SamplesDataList({this.sampleUrl,this.title,this.file,this.sampleType,this.sortOrder,this.sampleId});

  factory SamplesDataList.fromJson(Map<String, dynamic> json) =>
      _$SamplesDataListFromJson(json);

  Map<String, dynamic> toJson() => _$SamplesDataListToJson(this);
}

