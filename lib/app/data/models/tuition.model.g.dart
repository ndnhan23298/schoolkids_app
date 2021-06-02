// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuition.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return StudentModel(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    id: json['id'] as String,
    classID: json['classID'] as String,
  );
}

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'classID': instance.classID,
    };

TuitionModel _$TuitionModelFromJson(Map<String, dynamic> json) {
  return TuitionModel(
    fee: json['fee'] as String,
    month: json['month'] as String,
    id: json['id'] as String,
    status: json['status'] as String,
    studentID: json['studentID'] == null
        ? null
        : StudentModel.fromJson(json['studentID'] as Map<String, dynamic>),
    classID: json['classID'] as String,
  );
}

Map<String, dynamic> _$TuitionModelToJson(TuitionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'month': instance.month,
      'status': instance.status,
      'studentID': instance.studentID?.toJson(),
      'classID': instance.classID,
    };

TuitionParamModel _$TuitionParamModelFromJson(Map<String, dynamic> json) {
  return TuitionParamModel(
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$TuitionParamModelToJson(TuitionParamModel instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
