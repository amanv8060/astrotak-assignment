import 'package:equatable/equatable.dart';

class Slot with EquatableMixin {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };

  @override
  List<Object?> get props => [toFormat, fromFormat, from, to];
  @override
  bool? get stringify => true;
}
