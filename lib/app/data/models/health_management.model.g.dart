// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_management.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthManagementModel _$HealthManagementModelFromJson(
    Map<String, dynamic> json) {
  return HealthManagementModel(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    id: json['id'] as String,
    classID: json['classID'] as String,
  );
}

Map<String, dynamic> _$HealthManagementModelToJson(
        HealthManagementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'classID': instance.classID,
    };
