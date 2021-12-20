import 'package:equatable/equatable.dart';

class ApiImage with EquatableMixin {
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

  @override
  List<Object?> get props => [imageUrl, id];

  @override
  bool? get stringify => true;
}
