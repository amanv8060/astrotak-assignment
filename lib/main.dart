import 'package:app/app.dart';
import 'package:app/utils/get_it/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //loading env variables
  await dotenv.load(fileName: "assets/.env");
  setupLocator();

  runApp(const AstroTak());
}
