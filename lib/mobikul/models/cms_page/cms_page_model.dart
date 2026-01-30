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
part 'cms_page_model.g.dart';

@JsonSerializable()
class CmsPageModel{
  bool? success;
  String? message;
  String? title;
  String? content;
  String? url;
  CmsPageModel({this.success, this.message, this.title, this.content, this.url});

  factory CmsPageModel.fromJson(Map<String, dynamic> json) =>
      _$CmsPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CmsPageModelToJson(this);
}