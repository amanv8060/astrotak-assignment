import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Screen",
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        ),
        body: const Center(child: Text("Not Implemented")));
  }
}
