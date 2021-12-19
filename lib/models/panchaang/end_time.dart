class EndTime {
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
}
