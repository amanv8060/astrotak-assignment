import 'package:equatable/equatable.dart';

class TithiDetails with EquatableMixin {
  TithiDetails({
    required this.tithiNumber,
    required this.tithiName,
    required this.special,
    required this.summary,
    required this.deity,
  });

  int tithiNumber;
  String tithiName;
  String special;
  String summary;
  String deity;

  factory TithiDetails.fromJson(Map<String, dynamic> json) => TithiDetails(
        tithiNumber: json["tithi_number"],
        tithiName: json["tithi_name"],
        special: json["special"],
        summary: json["summary"],
        deity: json["deity"],
      );

  Map<String, dynamic> toJson() => {
        "tithi_number": tithiNumber,
        "tithi_name": tithiName,
        "special": special,
        "summary": summary,
        "deity": deity,
      };

  @override
  List<Object?> get props => [tithiNumber, tithiName, special, summary, deity];

  @override
  bool? get stringify => true;
}
