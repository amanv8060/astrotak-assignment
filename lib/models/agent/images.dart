import 'package:equatable/equatable.dart';
import 'api_image.dart';

class Images with EquatableMixin {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  ApiImage small;
  ApiImage large;
  ApiImage medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: ApiImage.fromJson(json["small"]),
        large: ApiImage.fromJson(json["large"]),
        medium: ApiImage.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };

  @override
  List<Object?> get props => [small, large, medium];

  @override
  bool? get stringify => true;
}
