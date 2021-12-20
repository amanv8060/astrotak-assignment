import 'package:equatable/equatable.dart';

class Language with EquatableMixin {
  Language({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}
