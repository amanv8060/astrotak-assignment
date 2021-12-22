import 'package:app/utils/constants.dart';

class ApiResponse<T> {
  ApiResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    this.apiName,
    this.data,
  });

  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String? apiName;
  T? data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
      httpStatus: json["httpStatus"] ?? "INTERNAL_SERVER_ERROR",
      httpStatusCode: json["httpStatusCode"] ?? "500",
      success: json["success"] ?? "false",
      message: json["message"] ?? Constants.networkExceptionText,
      apiName: json["apiName"],
      data: json["data"]);

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data
      };
}
