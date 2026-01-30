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
part 'upload_banner_mp_model.g.dart';

@JsonSerializable()
class UploadBannerMpModel extends BaseModel {
  String? url;

  UploadBannerMpModel({
    this.url,
  });

  factory UploadBannerMpModel.fromJson(Map<String, dynamic> json) =>
      _$UploadBannerMpModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadBannerMpModelToJson(this);
}
