import 'package:equatable/equatable.dart';

class Skill with EquatableMixin {
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };

  @override
  List<Object?> get props => [id, name, description];

  @override
  bool? get stringify => true;
}
