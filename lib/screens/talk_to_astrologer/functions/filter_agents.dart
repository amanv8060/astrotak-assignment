import 'package:app/models/agent.dart';

List<Agent> filterAgents(List<Agent> agents, Map<String, dynamic> filters) {
  List<String>? _languages = filters["languages"];
  List<String>? _skills = filters["skills"];
  //filter agents per language
  if (_languages != null && _languages.isNotEmpty) {
    Set _temp = _languages.toSet();
    agents = agents.where((element) {
      Set temp = element.languages.map((e) => e.name).toSet();
      return temp.intersection(_temp).isNotEmpty;
    }).toList();
  }
  //filter agents per skills
  if (_skills != null && _skills.isNotEmpty) {
    Set _temp = _skills.toSet();
    agents = agents.where((element) {
      Set temp = element.skills.map((e) => e.name).toSet();
      return temp.intersection(_temp).isNotEmpty;
    }).toList();
  }
  return agents;
}
