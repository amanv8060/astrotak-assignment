import 'package:equatable/equatable.dart';

class YogDetails with EquatableMixin {
  YogDetails({
    required this.yogNumber,
    required this.yogName,
    required this.special,
    required this.meaning,
  });

  int yogNumber;
  String yogName;
  String special;
  String meaning;

  factory YogDetails.fromJson(Map<String, dynamic> json) => YogDetails(
        yogNumber: json["yog_number"],
        yogName: json["yog_name"],
        special: json["special"],
        meaning: json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "yog_number": yogNumber,
        "yog_name": yogName,
        "special": special,
        "meaning": meaning,
      };

  @override
  List<Object?> get props => [yogNumber, yogName, special, meaning];

  @override
  bool? get stringify => true;
}
