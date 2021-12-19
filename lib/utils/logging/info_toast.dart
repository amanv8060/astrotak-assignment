import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Shows a [Fluttertoast] if a valid String is passed as message
class InfoToast {
  InfoToast(String? message) {
    if (message is String && message.isNotEmpty) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppTheme.toastColor,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }
}
