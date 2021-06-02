import 'package:json_annotation/json_annotation.dart';

part 'health.model.g.dart';

@JsonSerializable(explicitToJson: true)
class HealthModel {
  String id;
  String weight;
  String height;
  String note;
  String studentID;
  String checkedAt;

  HealthModel({this.weight, this.height, this.id, this.note, this.studentID, this.checkedAt});

  factory HealthModel.fromJson(Map<String, dynamic> json) =>
      _$HealthModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HealthParamModel {
  String height;
  String weight;
  String note;
  String studentID;

  HealthParamModel({this.height, this.weight, this.note, this.studentID});

  factory HealthParamModel.fromJson(Map<String, dynamic> json) =>
      _$HealthParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthParamModelToJson(this);
}
