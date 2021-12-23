import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  //Network Constants
  static const String networkExceptionText =
      "Could not connect to our server. Please try again later";
  static const String unknownExceptionText =
      "Something went wrong. Please try again later";

  static String? apiEndPoint = dotenv.env["HOST"];

  /*
    API-HTTP Constants
  */

  /// Max no of retries for a api
  static const int retryCount = 3;

  /// Interval between each retry in millisecond
  static const int retryDuration = 3000;

  /// connection timeout duration in milliseconds
  static const int httpConnectTimeout = 5000;

  /*
  Image Constants
   */

  static const String defaultAgentImage =
      "http://www.ll-mm.com/images/placeholders/team-placeholder.jpg";

  /*
  Filter constants
   */

  /// Skills availble in the api response
  static const List<String> skills = [
    "Astrology",
    "Vastu",
    "Numerology",
    "Palmistry",
    "Tarot",
    "Falit Jyotish",
    "Kundali Grah Dosh",
    "Vedic Astrology",
    "Face Reading",
  ];

  /// Language availble in the api response
  static const List<String> languages = ["Hindi", "English"];
}
