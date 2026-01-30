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

part 'add_another_link_model.g.dart';

@JsonSerializable()
class AddAnotherLinkModel extends BaseModel {
  int? id;
  String? linkTitle;
  String? linkPrice;
  String? linkType;
  String? linkFile;
  String? linkUrl;
  String? sampleType;
  String? sampleFile;
  String? sampleLink;
  bool? isLinkShareable = false;
  bool? isUnlimited = false;
  String? maxDownload;
  bool? isVisible = false;
  bool? isDeleted = false;


  AddAnotherLinkModel(
      this.id,
      this.linkTitle,
      this.linkPrice,
      this.linkType,
      this.linkFile,
      this.linkUrl,
      this.sampleType,
      this.sampleFile,
      this.sampleLink,
      this.isLinkShareable,
      this.isUnlimited,
      this.maxDownload,
      this.isVisible,
      this.isDeleted
      );


  // @override
  // String toString() {
  //   return 'AddAnotherLinkModel(addAnotherLinkTitle: $addAnotherLinkTitle, addAnotherLinkPrice: $addAnotherLinkPrice, fileTypeValue: $fileTypeValue, addAnotherLinkUrl: $addAnotherLinkUrl,addAnotherLinkFile:$addAnotherLinkFile,sampleTypeValue:$sampleTypeValue, addAnotherLinkShareableValue:$addAnotherLinkShareableValue,isUnlimited:$isUnlimited,addAnotherLinkMaxDownload:$addAnotherLinkMaxDownload)';
  // }

  factory AddAnotherLinkModel.fromJson(Map<String, dynamic> json) =>
      _$AddAnotherLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnotherLinkModelToJson(this);
}
