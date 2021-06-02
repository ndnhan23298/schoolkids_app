import 'package:json_annotation/json_annotation.dart';

part 'health_management.model.g.dart';

@JsonSerializable(explicitToJson: true)
class HealthManagementModel {
  String id;
  String firstName;
  String lastName;
  String classID;

  HealthManagementModel({this.firstName, this.lastName, this.id, this.classID});

  factory HealthManagementModel.fromJson(Map<String, dynamic> json) =>
      _$HealthManagementModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthManagementModelToJson(this);
}

