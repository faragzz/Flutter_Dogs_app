import 'dart:convert';

ImagesModel imagesModelFromJson(String str) =>
    ImagesModel.fromJson(json.decode(str));

String imagesModelToJson(ImagesModel data) => json.encode(data.toJson());

class ImagesModel {
  List<String> message;
  String status;

  ImagesModel({
    required this.message,
    required this.status,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        message: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status": status,
      };
}
