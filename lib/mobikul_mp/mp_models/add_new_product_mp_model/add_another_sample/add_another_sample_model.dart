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
import 'package:test_new/mobikul/models/base_model.dart';

part 'add_another_sample_model.g.dart';

@JsonSerializable()
class AddAnotherSampleModel extends BaseModel {
  int? id;
  String? sampleTitle;
  String? sampleType;
  String? sampleFile;
  String? sampleUrl;
  bool isVisible = false;
  bool? isDeleted = false;

  AddAnotherSampleModel(
    this.id,
    this.isVisible, {
    this.sampleTitle,
    this.sampleType,
    this.sampleFile,
    this.sampleUrl,
    this.isDeleted,
  });

  factory AddAnotherSampleModel.fromJson(Map<String, dynamic> json) =>
      _$AddAnotherSampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnotherSampleModelToJson(this);
}
