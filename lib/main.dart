import 'package:app/app.dart';
import 'package:app/utils/get_it/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //loading env variables
  await FlutterConfig.loadEnvVariables();
  setupLocator();

  runApp(AstroTak());
}
