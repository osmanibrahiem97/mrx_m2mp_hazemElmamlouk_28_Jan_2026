// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaGallery _$MediaGalleryFromJson(Map<String, dynamic> json) => MediaGallery(
      removed: json['removed'] as bool?,
      valueId: json['value_id'] as String?,
      file: json['file'] as String?,
      mediaType: json['media_type'] as String?,
      entityId: json['entity_id'] as String?,
      label: json['label'] as String?,
      position: json['position'] as String?,
      disabled: json['disabled'] as String?,
      labelDefault: json['label_default'] as String?,
      positionDefault: json['position_default'] as String?,
      disabledDefault: json['disabled_default'] as String?,
      videoProvider: json['video_provider'] as String?,
      videoUrl: json['video_url'] as String?,
      videoTitle: json['video_title'] as String?,
      videoDescription: json['video_description'] as String?,
      videoMetadata: json['video_metadata'] as String?,
      videoProviderDefault: json['video_provider_default'] as String?,
      videoUrlDefault: json['video_url_default'] as String?,
      videoTitleDefault: json['video_title_default'] as String?,
      videoDescriptionDefault: json['video_description_default'] as String?,
      videoMetadataDefault: json['video_metadata_default'] as String?,
      url: json['url'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isBase: json['isBase'] as bool?,
      isSwatch: json['isSwatch'] as bool?,
      isSmall: json['isSmall'] as bool?,
      isThumbnail: json['isThumbnail'] as bool?,
    );

Map<String, dynamic> _$MediaGalleryToJson(MediaGallery instance) =>
    <String, dynamic>{
      'removed': instance.removed,
      'value_id': instance.valueId,
      'file': instance.file,
      'media_type': instance.mediaType,
      'entity_id': instance.entityId,
      'label': instance.label,
      'position': instance.position,
      'disabled': instance.disabled,
      'label_default': instance.labelDefault,
      'position_default': instance.positionDefault,
      'disabled_default': instance.disabledDefault,
      'video_provider': instance.videoProvider,
      'video_url': instance.videoUrl,
      'video_title': instance.videoTitle,
      'video_description': instance.videoDescription,
      'video_metadata': instance.videoMetadata,
      'video_provider_default': instance.videoProviderDefault,
      'video_url_default': instance.videoUrlDefault,
      'video_title_default': instance.videoTitleDefault,
      'video_description_default': instance.videoDescriptionDefault,
      'video_metadata_default': instance.videoMetadataDefault,
      'url': instance.url,
      'id': instance.id,
      'isBase': instance.isBase,
      'isSwatch': instance.isSwatch,
      'isSmall': instance.isSmall,
      'isThumbnail': instance.isThumbnail,
    };
