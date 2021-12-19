import 'end_time.dart';
import 'karan_details.dart';

class Karan {
  Karan({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  KaranDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Karan.fromJson(Map<String, dynamic> json) => Karan(
        details: KaranDetails.fromJson(json["details"]),
        endTime: EndTime.fromJson(json["end_time"]),
        endTimeMs: json["end_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "end_time": endTime.toJson(),
        "end_time_ms": endTimeMs,
      };
}
