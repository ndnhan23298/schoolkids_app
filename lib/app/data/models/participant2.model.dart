import 'package:doan/app/data/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'participant2.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ParticipantModel {
  String id;
  String activityID;
  String classID;
  StudentModel studentID;

  ParticipantModel({this.activityID, this.classID, this.id, this.studentID});

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantModelToJson(this);
}