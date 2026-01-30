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

import '../../../../mobikul/models/base_model.dart';
part 'sample_file_data_model.g.dart';

@JsonSerializable()

class SampleFileDataModel extends BaseModel {
  String? sample_id;
  String? file;
  dynamic? size;
  String? status;
  String? name;

  SampleFileDataModel(this.file, this.name, this.size, this.status,this.sample_id);
  factory SampleFileDataModel.fromJson(Map<String, dynamic> json) =>
      _$SampleFileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleFileDataModelToJson(this);
}