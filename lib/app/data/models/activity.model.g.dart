// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return ActivityModel(
    name: json['name'] as String,
    address: json['address'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

ActivityParamModel _$ActivityParamModelFromJson(Map<String, dynamic> json) {
  return ActivityParamModel(
    name: json['name'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$ActivityParamModelToJson(ActivityParamModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };
