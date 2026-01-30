// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkData _$LinkDataFromJson(Map<String, dynamic> json) => LinkData(
      (json['link_id'] as num?)?.toInt(),
      json['title'] as String?,
      json['price'] as String?,
      json['formattedPrice'] as String?,
      json['link_url'] as String?,
      json['is_shareable'] as String?,
      (json['number_of_downloads'] as num?)?.toInt(),
      json['sample'] == null
          ? null
          : SampleDataModel.fromJson(json['sample'] as Map<String, dynamic>),
      (json['file'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
      json['id'],
    );

Map<String, dynamic> _$LinkDataToJson(LinkData instance) => <String, dynamic>{
      'link_id': instance.id,
      'id': instance.linkId,
      'title': instance.linkTitle,
      'price': instance.price,
      'formattedPrice': instance.formattedPrice,
      'type': instance.linkType,
      'link_url': instance.url,
      'file': instance.file,
      'is_shareable': instance.isShareable,
      'sample': instance.sample,
      'number_of_downloads': instance.isDownloadable,
    };
