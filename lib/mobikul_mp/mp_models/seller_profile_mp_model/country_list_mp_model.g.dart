// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_mp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListMpModel _$CountryListMpModelFromJson(Map<String, dynamic> json) =>
    CountryListMpModel(
      value: json['value'] as String?,
      label: json['label'] as String?,
      isRegionVisible: json['isRegionVisible'] as bool?,
      isRegionRequired: json['isRegionRequired'] as bool?,
      isZipcodeOptional: json['isZipcodeOptional'] as bool?,
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$CountryListMpModelToJson(CountryListMpModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'isRegionVisible': instance.isRegionVisible,
      'isRegionRequired': instance.isRegionRequired,
      'isZipcodeOptional': instance.isZipcodeOptional,
      'isDefault': instance.isDefault,
    };
