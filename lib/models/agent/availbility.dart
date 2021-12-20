import 'package:equatable/equatable.dart';
import 'slot.dart';

class Availability with EquatableMixin {
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
  @override
  List<Object?> get props => [days, slot];

  @override
  bool? get stringify => true;
}
