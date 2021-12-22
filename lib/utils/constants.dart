import 'package:flutter_config/flutter_config.dart';

class Constants {
  //Network Constants
  static const String networkExceptionText =
      "Could not connect to our server. Please try again later";
  static const String unknownExceptionText =
      "Something went wrong. Please try again later";

  static String? apiEndPoint = FlutterConfig.get("HOST");

  /*
    API-HTTP Constants
  */

  /// Max no of retries for a api
  static const int retryCount = 3;

  /// Interval between each retry in millisecond
  static const int retryDuration = 3000;

  /// connection timeout duration in milliseconds
  static const int httpConnectTimeout = 5000;
}
