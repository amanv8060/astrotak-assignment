import 'package:app/models/panchaang/nakshatra_details.dart';

import 'end_time.dart';

class Nakshatra {
  Nakshatra({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  NakshatraDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Nakshatra.fromJson(Map<String, dynamic> json) => Nakshatra(
        details: NakshatraDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "end_time": endTime.toJson(),
        "end_time_ms": endTimeMs,
      };
}
