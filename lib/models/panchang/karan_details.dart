import 'package:equatable/equatable.dart';

class KaranDetails with EquatableMixin {
  KaranDetails({
    required this.karanNumber,
    required this.karanName,
    required this.special,
    required this.deity,
  });

  int karanNumber;
  String karanName;
  String special;
  String deity;

  factory KaranDetails.fromJson(Map<String, dynamic> json) => KaranDetails(
        karanNumber: json["karan_number"],
        karanName: json["karan_name"],
        special: json["special"],
        deity: json["deity"],
      );

  Map<String, dynamic> toJson() => {
        "karan_number": karanNumber,
        "karan_name": karanName,
        "special": special,
        "deity": deity,
      };

  @override
  List<Object?> get props => [karanNumber, karanName, special, deity];

  @override
  bool? get stringify => true;
}
