import 'package:app/utils/constants.dart';

class ApiResponse<T> {
  T? data;
  late bool status;
  String? message;

  factory ApiResponse(bool status, T data) {
    if (status) {
      return ApiResponse.completed(data);
    } else {
      return ApiResponse.error(data);
    }
  }

  ApiResponse.completed(this.data) {
    status = true;
  }

  ApiResponse.error(dynamic message) {
    status = false;
    if (message is String) {
      if (message.isNotEmpty) {
        this.message = message;
      } else {
        this.message = Constants.unknownExceptionText;
      }
    } else if (message is Map && message.containsKey("detail")) {
      this.message = message["detail"] ?? Constants.unknownExceptionText;
    }
  }
}
