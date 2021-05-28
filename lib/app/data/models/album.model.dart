import 'package:json_annotation/json_annotation.dart';

part 'album.model.g.dart';

@JsonSerializable(explicitToJson: true)
class AlbumModel {
  String id;
  String name;
  List<String> images;
  String classID;

  AlbumModel({this.id, this.name, List<String> images, this.classID})
      : images = images ?? [];

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}
