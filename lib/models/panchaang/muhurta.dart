class Muhurta {
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
}
