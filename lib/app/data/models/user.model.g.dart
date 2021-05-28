// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) {
  return UserLoginModel(
    userId: json['userId'] as String,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$UserLoginModelToJson(UserLoginModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
    };

RoleAccess _$RoleAccessFromJson(Map<String, dynamic> json) {
  return RoleAccess(
    id: json['id'] as String,
    userId: json['userId'] as String,
    classId: json['classId'] as String,
    studentId: json['studentId'] as String,
    schoolId: json['schoolId'] as String,
    status: json['status'] as String,
    roleName: json['roleName'] as String,
  );
}

Map<String, dynamic> _$RoleAccessToJson(RoleAccess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'classId': instance.classId,
      'studentId': instance.studentId,
      'schoolId': instance.schoolId,
      'status': instance.status,
      'roleName': instance.roleName,
    };

UserAccess _$UserAccessFromJson(Map<String, dynamic> json) {
  return UserAccess(
    json['id'] as String,
    json['userName'] as String,
    json['password'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['phoneNumber'] as String,
    json['email'] as String,
    (json['classes'] as List)
        ?.map((e) =>
            e == null ? null : ClassModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['students'] as List)
        ?.map((e) =>
            e == null ? null : StudentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['schools'] as List)
        ?.map((e) =>
            e == null ? null : SchoolModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserAccessToJson(UserAccess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'classes': instance.classes,
      'students': instance.students,
      'schools': instance.schools,
    };

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return StudentModel(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
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

ClassModel _$ClassModelFromJson(Map<String, dynamic> json) {
  return ClassModel(
    id: json['id'] as String,
    name: json['name'] as String,
    grade: json['grade'] as String,
  );
}

Map<String, dynamic> _$ClassModelToJson(ClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': instance.grade,
    };

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) {
  return SchoolModel(
    id: json['id'] as String,
    name: json['name'] as String,
    info: json['info'] as String,
  );
}

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String,
    userName: json['userName'] as String,
    password: json['password'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
