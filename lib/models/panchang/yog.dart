import 'package:equatable/equatable.dart';
import 'yog_details.dart';
import 'end_time.dart';

class Yog with EquatableMixin {
  Yog({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  YogDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Yog.fromJson(Map<String, dynamic> json) => Yog(
        details: YogDetails.fromJson(json["details"]),
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
