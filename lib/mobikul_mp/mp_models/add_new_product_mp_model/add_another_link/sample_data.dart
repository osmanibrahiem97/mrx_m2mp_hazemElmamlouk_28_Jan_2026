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
import 'file_data_model.dart';
part 'sample_data.g.dart';

@JsonSerializable()

class SampleDataModel extends BaseModel {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'file')
  List<FileModel>? file;

  SampleDataModel(this.type,this.file);
  factory SampleDataModel.fromJson(Map<String, dynamic> json) =>
      _$SampleDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleDataModelToJson(this);
}