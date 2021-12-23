import 'package:app/models/agent/skill.dart';

///Return the [Agent] skill in form of String
String getSkillsAsString(List<Skill> skills) {
  return skills.map((e) => e.name).toList().join(', ');
}
