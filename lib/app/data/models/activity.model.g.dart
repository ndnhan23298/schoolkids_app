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

ParticipantParamModel _$ParticipantParamModelFromJson(
    Map<String, dynamic> json) {
  return ParticipantParamModel(
    activityID: json['activityID'] as String,
    studentID: json['studentID'] as String,
    classID: json['classID'] as String,
  );
}

Map<String, dynamic> _$ParticipantParamModelToJson(
        ParticipantParamModel instance) =>
    <String, dynamic>{
      'activityID': instance.activityID,
      'studentID': instance.studentID,
      'classID': instance.classID,
    };
