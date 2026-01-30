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
part 'upload_file_data_model.g.dart';

@JsonSerializable()
class UploadDownloadableProductFileModel extends BaseModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "size")
  dynamic? size;

  UploadDownloadableProductFileModel({
    this.success,
    this.message,
    this.file,
    this.name,
    this.size,
  });

  factory UploadDownloadableProductFileModel.fromJson(Map<String, dynamic> json) =>
      _$UploadDownloadableProductFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadDownloadableProductFileModelToJson(this);
}