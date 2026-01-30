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

part 'media_gallery.g.dart';

@JsonSerializable()
class MediaGallery {
  @JsonKey(name: "removed")
  bool? removed;
  @JsonKey(name: "value_id")
  String? valueId;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "media_type")
  String? mediaType;
  @JsonKey(name: "entity_id")
  String? entityId;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "position")
  String? position;
  @JsonKey(name: "disabled")
  String? disabled;
  @JsonKey(name: "label_default")
  String? labelDefault;
  @JsonKey(name: "position_default")
  String? positionDefault;
  @JsonKey(name: "disabled_default")
  String? disabledDefault;
  @JsonKey(name: "video_provider")
  String? videoProvider;
  @JsonKey(name: "video_url")
  String? videoUrl;
  @JsonKey(name: "video_title")
  String? videoTitle;
  @JsonKey(name: "video_description")
  String? videoDescription;
  @JsonKey(name: "video_metadata")
  String? videoMetadata;
  @JsonKey(name: "video_provider_default")
  String? videoProviderDefault;
  @JsonKey(name: "video_url_default")
  String? videoUrlDefault;
  @JsonKey(name: "video_title_default")
  String? videoTitleDefault;
  @JsonKey(name: "video_description_default")
  String? videoDescriptionDefault;
  @JsonKey(name: "video_metadata_default")
  String? videoMetadataDefault;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "isBase")
  bool? isBase = false;
  @JsonKey(name: "isSwatch")
  bool? isSwatch = false;
  @JsonKey(name: "isSmall")
  bool? isSmall = false;
  @JsonKey(name: "isThumbnail")
  bool? isThumbnail;

  MediaGallery({
    this.removed,
    this.valueId,
    this.file,
    this.mediaType,
    this.entityId,
    this.label,
    this.position,
    this.disabled,
    this.labelDefault,
    this.positionDefault,
    this.disabledDefault,
    this.videoProvider,
    this.videoUrl,
    this.videoTitle,
    this.videoDescription,
    this.videoMetadata,
    this.videoProviderDefault,
    this.videoUrlDefault,
    this.videoTitleDefault,
    this.videoDescriptionDefault,
    this.videoMetadataDefault,
    this.url,
    this.id,
    this.isBase,
    this.isSwatch,
    this.isSmall,
    this.isThumbnail,
  });

  factory MediaGallery.fromJson(Map<String, dynamic> json) =>
      _$MediaGalleryFromJson(json);

  Map<String, dynamic> toJson() => _$MediaGalleryToJson(this);
}
