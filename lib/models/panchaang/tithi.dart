import 'package:app/models/panchaang/tithi_details.dart';
import 'package:equatable/equatable.dart';

import 'end_time.dart';

class Tithi with EquatableMixin {
  Tithi({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  TithiDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Tithi.fromJson(Map<String, dynamic> json) => Tithi(
        details: TithiDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "end_time": endTime.toJson(),
        "end_time_ms": endTimeMs,
      };

  @override
  List<Object?> get props => [details, endTime, endTimeMs];

  @override
  bool? get stringify => true;
}
