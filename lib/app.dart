import 'package:app/screens/mainscreen/main_screen.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AstroTak extends StatelessWidget {
  const AstroTak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        title: 'AstroTak', theme: AppTheme.globalTheme, home: MainScreen());
  }
}
