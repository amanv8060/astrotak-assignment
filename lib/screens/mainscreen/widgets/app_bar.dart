import 'package:app/screens/profile/profile_screen.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context, {Key? key})
      : super(
          key: key,
          title: Image.asset(
            "assets/logo.png",
            width: SizeConfig.fitToWidth(50),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  "assets/hamburger.png",
                  width: SizeConfig.fitToWidth(24),
                  height: SizeConfig.fitToHeight(24),
                  color: AppTheme.primaryColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                "assets/profile.png",
                width: SizeConfig.fitToWidth(24),
                height: SizeConfig.fitToHeight(24),
                color: AppTheme.primaryColor,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          ],
        );
}
