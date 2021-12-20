import 'package:equatable/equatable.dart';

class EndTime with EquatableMixin {
  EndTime({
    required this.hour,
    required this.minute,
    required this.second,
  });

  int hour;
  int minute;
  int second;

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
        hour: json["hour"],
        minute: json["minute"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "second": second,
      };

  @override
  List<Object?> get props => [hour, minute, second];

  @override
  bool? get stringify => true;
}
