import 'package:json_annotation/json_annotation.dart';

part 'activity.model.g.dart';

@JsonSerializable(explicitToJson: true)
class ActivityModel {
  String id;
  String name;
  String address;

  ActivityModel({this.name, this.address, this.id});

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivityParamModel {
  String name;
  String address;

  ActivityParamModel({this.name, this.address});

  factory ActivityParamModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityParamModelToJson(this);
}
