import 'package:equatable/equatable.dart';

class Muhurta with EquatableMixin {
  Muhurta({
    required this.start,
    required this.end,
  });

  String start;
  String end;

  factory Muhurta.fromJson(Map<String, dynamic> json) => Muhurta(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
  @override
  List<Object?> get props => [start, end];

  @override
  bool? get stringify => true;
}
