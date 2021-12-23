import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

List<BottomNavigationBarItem> getBottomNavBarItems() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/home.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: AppTheme.greyColor,
      ),
      activeIcon: Image.asset(
        "assets/home.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: AppTheme.primaryColor,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/talk.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/talk.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: AppTheme.primaryColor,
      ),
      label: 'Talk to Astrologer',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/ask.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/ask.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: AppTheme.primaryColor,
      ),
      label: 'Ask Question',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/reports.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/reports.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: AppTheme.primaryColor,
      ),
      label: 'Reports',
    ),
  ];
}
