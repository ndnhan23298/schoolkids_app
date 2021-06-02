// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_day.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
