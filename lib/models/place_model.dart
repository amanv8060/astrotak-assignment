import 'dart:convert';

class Place {
  Place({
    required this.placeName,
    required this.placeId,
  });

  final String placeName;
  final String placeId;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
