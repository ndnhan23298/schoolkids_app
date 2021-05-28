import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserLoginModel {
  String userId;
  String accessToken;

  UserLoginModel({this.userId, this.accessToken});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}

@JsonSerializable()
class RoleAccess {
  String id;
  String userId;
  String classId;
  String studentId;
  String schoolId;
  String status;
  String roleName;

  RoleAccess(
      {this.id,
      this.userId,
      this.classId,
      this.studentId,
      this.schoolId,
      this.status,
      this.roleName});

  factory RoleAccess.fromJson(Map<String, dynamic> json) =>
      _$RoleAccessFromJson(json);

  Map<String, dynamic> toJson() => _$RoleAccessToJson(this);
}

@JsonSerializable()
class UserAccess {
  String id;
  String userName;
  String password;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  List<ClassModel> classes;
  List<StudentModel> students;
  List<SchoolModel> schools;

  UserAccess(
      this.id,
      this.userName,
      this.password,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      List<ClassModel> classes,
      List<StudentModel> students,
      List<SchoolModel> schools)
      : classes = classes ?? [],
        students = students ?? [],
        schools = schools ?? [];

  factory UserAccess.fromJson(Map<String, dynamic> json) =>
      _$UserAccessFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccessToJson(this);
}

@JsonSerializable()
class StudentModel {
  String id;
  String firstName;
  String lastName;
  String classID;

  StudentModel({this.id, this.firstName, this.lastName, this.classID});

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}

@JsonSerializable()
class ClassModel {
  String id;
  String name;
  String grade;

  ClassModel({this.id, this.name, this.grade});

  factory ClassModel.fromJson(Map<String, dynamic> json) =>
      _$ClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClassModelToJson(this);
}

@JsonSerializable()
class SchoolModel {
  String id;
  String name;
  String info;

  SchoolModel({this.id, this.name, this.info});

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}

@JsonSerializable()
class UserModel {
  String id;
  String userName;
  String password;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  UserModel({this.id, this.userName, this.password, this.firstName,
      this.lastName, this.email, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}

class DataAccessModel {
  String id;
  String name;
  String classId;

  DataAccessModel({this.id, this.name,this.classId});
}
