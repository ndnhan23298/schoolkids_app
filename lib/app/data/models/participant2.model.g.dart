// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant2.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) {
  return ParticipantModel(
    activityID: json['activityID'] as String,
    classID: json['classID'] as String,
    id: json['id'] as String,
    studentID: json['studentID'] == null
        ? null
        : StudentModel.fromJson(json['studentID'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ParticipantModelToJson(ParticipantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activityID': instance.activityID,
      'classID': instance.classID,
      'studentID': instance.studentID?.toJson(),
    };
