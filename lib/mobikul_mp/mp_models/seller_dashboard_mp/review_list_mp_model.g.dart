// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListMpModel _$ReviewListMpModelFromJson(Map<String, dynamic> json) =>
    ReviewListMpModel(
      name: json['name'] as String?,
      date: json['date'] as String?,
      comment: json['comment'] as String?,
      priceRating: json['priceRating'],
      valueRating: json['valueRating'],
      qualityRating: json['qualityRating'],
      avgRating: json['avgRating'],
    );

Map<String, dynamic> _$ReviewListMpModelToJson(ReviewListMpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'comment': instance.comment,
      'priceRating': instance.priceRating,
      'valueRating': instance.valueRating,
      'qualityRating': instance.qualityRating,
      'avgRating': instance.avgRating,
    };
