import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

List<BottomNavigationBarItem> getBottomNavBarItems() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/home.png",
        width: 24,
        height: 24,
        color: AppTheme.greyColor,
      ),
      activeIcon: Image.asset(
        "assets/home.png",
        width: 24,
        height: 24,
        color: AppTheme.primaryColor,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/talk.png",
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        "assets/talk.png",
        width: 24,
        height: 24,
        color: AppTheme.primaryColor,
      ),
      label: 'Talk to Astrologer',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/ask.png",
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        "assets/ask.png",
        width: 24,
        height: 24,
        color: AppTheme.primaryColor,
      ),
      label: 'Ask Question',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/reports.png",
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        "assets/reports.png",
        width: 24,
        height: 24,
        color: AppTheme.primaryColor,
      ),
      label: 'Reports',
    ),
  ];
}
