import 'package:app/models/agent/slot.dart';

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });

  List<String> days;
  Slot slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toJson(),
      };
}
