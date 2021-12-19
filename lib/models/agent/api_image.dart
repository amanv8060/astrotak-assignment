class ApiImage {
  ApiImage({
    required this.imageUrl,
    required this.id,
  });

  String? imageUrl;
  int? id;

  factory ApiImage.fromJson(Map<String, dynamic> json) => ApiImage(
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}
