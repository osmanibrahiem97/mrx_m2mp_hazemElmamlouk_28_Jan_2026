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
part 'file_data_model.g.dart';

@JsonSerializable()

class FileModel extends BaseModel {
  String? file;
  String? name;
  dynamic? size;
  String? status;

  FileModel(this.file, this.name, this.size, this.status);
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}