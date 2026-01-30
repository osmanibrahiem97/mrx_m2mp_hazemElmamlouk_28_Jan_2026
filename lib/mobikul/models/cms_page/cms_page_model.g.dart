// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmsPageModel _$CmsPageModelFromJson(Map<String, dynamic> json) => CmsPageModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CmsPageModelToJson(CmsPageModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
    };
