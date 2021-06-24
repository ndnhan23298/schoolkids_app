import 'package:json_annotation/json_annotation.dart';

part 'health_management.model.g.dart';

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

