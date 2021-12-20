import 'package:equatable/equatable.dart';

class HinduMaah with EquatableMixin {
  HinduMaah({
    required this.adhikStatus,
    required this.purnimanta,
    required this.amanta,
    required this.amantaId,
    required this.purnimantaId,
  });

  bool adhikStatus;
  String purnimanta;
  String amanta;
  int amantaId;
  int purnimantaId;

  factory HinduMaah.fromJson(Map<String, dynamic> json) => HinduMaah(
        adhikStatus: json["adhik_status"],
        purnimanta: json["purnimanta"],
        amanta: json["amanta"],
        amantaId: json["amanta_id"],
        purnimantaId: json["purnimanta_id"],
      );

  Map<String, dynamic> toJson() => {
        "adhik_status": adhikStatus,
        "purnimanta": purnimanta,
        "amanta": amanta,
        "amanta_id": amantaId,
        "purnimanta_id": purnimantaId,
      };

  @override
  List<Object?> get props =>
      [adhikStatus, purnimanta, amanta, amantaId, purnimantaId];

  @override
  bool? get stringify => true;
}
