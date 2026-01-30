// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      categoryId: json['category_id'] as String?,
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChecked: json['isChecked'] as bool?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'children': instance.children,
      'isChecked': instance.isChecked,
    };
