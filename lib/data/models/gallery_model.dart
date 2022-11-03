import 'package:meta/meta.dart';
import 'dart:convert';

GalleryModel galleryModelFromJson(String str) => GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  GalleryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final String status;
  final Data data;
  final String message;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.images,
  });

  final List<String> images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
