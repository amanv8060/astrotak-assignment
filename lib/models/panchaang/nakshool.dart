import 'package:equatable/equatable.dart';

class NakShool with EquatableMixin {
  NakShool({
    required this.direction,
    required this.remedies,
  });

  String direction;
  String remedies;

  factory NakShool.fromJson(Map<String, dynamic> json) => NakShool(
        direction: json["direction"],
        remedies: json["remedies"],
      );

  Map<String, dynamic> toJson() => {
        "direction": direction,
        "remedies": remedies,
      };

  @override
  List<Object?> get props => [direction, remedies];

  @override
  bool? get stringify => true;
}
