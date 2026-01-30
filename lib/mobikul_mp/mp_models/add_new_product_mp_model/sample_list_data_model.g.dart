// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_list_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SamplesDataList _$SamplesDataListFromJson(Map<String, dynamic> json) =>
    SamplesDataList(
      sampleUrl: json['sample_url'] as String?,
      title: json['title'] as String?,
      file: (json['file'] as List<dynamic>?)
          ?.map((e) => SampleFileDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sampleType: json['type'] as String?,
      sortOrder: json['sort_order'] as String?,
      sampleId: json['sample_id'] as String?,
    );

Map<String, dynamic> _$SamplesDataListToJson(SamplesDataList instance) =>
    <String, dynamic>{
      'sample_id': instance.sampleId,
      'type': instance.sampleType,
      'sample_url': instance.sampleUrl,
      'sort_order': instance.sortOrder,
      'title': instance.title,
      'file': instance.file,
    };
