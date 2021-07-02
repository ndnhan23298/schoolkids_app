// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_day.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveDayModel _$LeaveDayModelFromJson(Map<String, dynamic> json) {
  return LeaveDayModel(
    studentID: json['studentID'] == null
        ? null
        : StudentModel.fromJson(json['studentID'] as Map<String, dynamic>),
    firstDay: json['firstDay'] as String,
    id: json['id'] as String,
    lastDay: json['lastDay'] as String,
    content: json['content'] as String,
    classID: json['classID'] as String,
    daysOff: json['daysOff'] as int,
  );
}

Map<String, dynamic> _$LeaveDayModelToJson(LeaveDayModel instance) =>
    <String, dynamic>{
      'firstDay': instance.firstDay,
      'id': instance.id,
      'lastDay': instance.lastDay,
      'content': instance.content,
      'studentID': instance.studentID?.toJson(),
      'daysOff': instance.daysOff,
      'classID': instance.classID,
    };

LeaveDayParamModel _$LeaveDayParamModelFromJson(Map<String, dynamic> json) {
  return LeaveDayParamModel(
    firstDay: json['firstDay'] as String,
    lastDay: json['lastDay'] as String,
    content: json['content'] as String,
    studentID: json['studentID'] as String,
  );
}

Map<String, dynamic> _$LeaveDayParamModelToJson(LeaveDayParamModel instance) =>
    <String, dynamic>{
      'firstDay': instance.firstDay,
      'lastDay': instance.lastDay,
      'content': instance.content,
      'studentID': instance.studentID,
    };
