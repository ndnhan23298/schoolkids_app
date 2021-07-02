import 'package:doan/app/data/models/health_management.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leave_day.model.g.dart';

// @JsonSerializable(explicitToJson: true)
// class HealthModel {
//   String id;
//   String firstDay;
//   String lastDay;
//   String content;
//   String studentID;
//
//   HealthModel({this.firstDay, this.lastDay, this.id, this.content, this.studentID});
//
//   factory HealthModel.fromJson(Map<String, dynamic> json) =>
//       _$LeaveDayModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LeaveDayModelToJson(this);
// }
@JsonSerializable(explicitToJson: true)
class LeaveDayModel {
  String firstDay;
  String id;
  String lastDay;
  String content;
  StudentModel studentID;
  int daysOff;
  String classID;

  LeaveDayModel({this.studentID, this.firstDay, this.id, this.lastDay, this.content, this.classID, this.daysOff});

  factory LeaveDayModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveDayModelToJson(this);
}


@JsonSerializable(explicitToJson: true)
class LeaveDayParamModel {
  String firstDay;
  String lastDay;
  String content;
  String studentID;

  LeaveDayParamModel({this.firstDay, this.lastDay, this.content, this.studentID});

  factory LeaveDayParamModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveDayParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveDayParamModelToJson(this);
}
