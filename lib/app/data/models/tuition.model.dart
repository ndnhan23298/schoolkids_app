import 'package:json_annotation/json_annotation.dart';

part 'tuition.model.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentModel {
  String id;
  String firstName;
  String lastName;
  String classID;

  StudentModel({this.firstName, this.lastName, this.id, this.classID});

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TuitionModel {
  String id;
  String fee;
  String month;
  String status;
  StudentModel studentID;
  String classID;

  TuitionModel({this.fee, this.month, this.id, this.status, this.studentID, this.classID});

  factory TuitionModel.fromJson(Map<String, dynamic> json) =>
      _$TuitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TuitionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TuitionParamModel {
  String status;

  TuitionParamModel({this.status});

  factory TuitionParamModel.fromJson(Map<String, dynamic> json) =>
      _$TuitionParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TuitionParamModelToJson(this);
}
