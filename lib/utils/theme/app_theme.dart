import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color? shimmerColor = Colors.grey[100];
  static Color shimmerBaseColor = const Color(0xff3C3C43).withOpacity(0.05);
  static Color shimmerHighlightColor = const Color(0xff3C3C43).withOpacity(0.1);
  static const Color greyColor = Color(0xffd3d3d3);
  static const Color toastColor = Color(0xff303030);
  static const Color primaryColor = Color(0xffe4933e);
  static const Color greyColor1 = Color(0xffcccccc);
  static const Color blueColor = Color(0xff98a3d5);

  static final ThemeData globalTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      iconTheme: IconThemeData(color: primaryColor),
    ),
    backgroundColor: const Color(0xffFFFFFF),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xfffdf2e9),
    ),
  );
}
