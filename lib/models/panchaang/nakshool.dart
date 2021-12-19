class NakShool {
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
}
