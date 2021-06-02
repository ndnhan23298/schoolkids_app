// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthModel _$HealthModelFromJson(Map<String, dynamic> json) {
  return HealthModel(
    weight: json['weight'] as String,
    height: json['height'] as String,
    id: json['id'] as String,
    note: json['note'] as String,
    studentID: json['studentID'] as String,
    checkedAt: json['checkedAt'] as String,
  );
}

Map<String, dynamic> _$HealthModelToJson(HealthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'height': instance.height,
      'note': instance.note,
      'studentID': instance.studentID,
      'checkedAt': instance.checkedAt,
    };

HealthParamModel _$HealthParamModelFromJson(Map<String, dynamic> json) {
  return HealthParamModel(
    height: json['height'] as String,
    weight: json['weight'] as String,
    note: json['note'] as String,
    studentID: json['studentID'] as String,
  );
}

Map<String, dynamic> _$HealthParamModelToJson(HealthParamModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'note': instance.note,
      'studentID': instance.studentID,
    };
