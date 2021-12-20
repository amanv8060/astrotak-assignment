import 'package:equatable/equatable.dart';

class NakshatraDetails with EquatableMixin {
  NakshatraDetails({
    required this.nakNumber,
    required this.nakName,
    required this.ruler,
    required this.deity,
    required this.special,
    required this.summary,
  });

  int nakNumber;
  String nakName;
  String ruler;
  String deity;
  String special;
  String summary;

  factory NakshatraDetails.fromJson(Map<String, dynamic> json) =>
      NakshatraDetails(
        nakNumber: json["nak_number"],
        nakName: json["nak_name"],
        ruler: json["ruler"],
        deity: json["deity"],
        special: json["special"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "nak_number": nakNumber,
        "nak_name": nakName,
        "ruler": ruler,
        "deity": deity,
        "special": special,
        "summary": summary,
      };

  @override
  List<Object?> get props =>
      [nakNumber, nakName, ruler, deity, special, summary];

  @override
  bool? get stringify => true;
}
