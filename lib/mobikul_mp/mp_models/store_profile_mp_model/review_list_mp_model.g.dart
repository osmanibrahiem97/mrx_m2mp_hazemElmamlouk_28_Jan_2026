// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListMpModel _$ReviewListMpModelFromJson(Map<String, dynamic> json) =>
    ReviewListMpModel(
      date: json['date'] as String?,
      summary: json['summary'] as String?,
      userName: json['userName'] as String?,
      feedPrice: json['feedPrice'] as String?,
      feedValue: json['feedValue'] as String?,
      feedQuality: json['feedQuality'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ReviewListMpModelToJson(ReviewListMpModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'summary': instance.summary,
      'userName': instance.userName,
      'feedPrice': instance.feedPrice,
      'feedValue': instance.feedValue,
      'feedQuality': instance.feedQuality,
      'description': instance.description,
    };
