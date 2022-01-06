import 'dart:convert';

ImagesItem imagesItemFromJson(String str) =>
    ImagesItem.fromJson(json.decode(str));

String imagesItemToJson(ImagesItem data) => json.encode(data.toJson());

class ImagesItem {
  ImagesItem({
    required this.imageName,
    required this.results,
  });

  final String imageName;
  final List<String> results;

  factory ImagesItem.fromJson(Map<String, dynamic> json) => ImagesItem(
        imageName: json["image_name"],
        results: List<String>.from(json["results"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image_name": imageName,
        "results": List<dynamic>.from(results.map((x) => x)),
      };
}
