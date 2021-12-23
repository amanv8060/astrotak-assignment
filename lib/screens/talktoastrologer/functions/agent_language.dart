import 'package:app/models/agent/language.dart';

///Return the [Agent] [Language] in form of String
String getLanguagesAsString(List<Language> languages) {
  return languages.map((e) => e.name).toList().join(', ');
}
