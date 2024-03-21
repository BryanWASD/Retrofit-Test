import 'package:json_annotation/json_annotation.dart';
part 'photos_model.g.dart';

@JsonSerializable()
class PhotosModel{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,   
  });

  factory PhotosModel.fromJson(Map<String,dynamic>json) => _$PhotosModelFromJson(json);
  Map<String,dynamic> toJson() => _$PhotosModelToJson(this);
}