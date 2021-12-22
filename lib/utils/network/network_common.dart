import 'package:app/utils/logging/custom_logger.dart';
import 'package:app/utils/logging/info_toast.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'dart:convert';

import '../constants.dart';

class NetworkCommon {
  Dio getClient() {
    Dio dio = Dio();
    dio.interceptors.add(_getRetryInterceptor(dio));
    dio.interceptors.add(_getInterceptorsWrapper());
    dio.options.headers['Content-Type'] = 'application/json';

    // handle timeouts
    dio.options.connectTimeout = Constants.httpConnectTimeout;
    dio.options.receiveTimeout = Constants.httpConnectTimeout;

    return dio;
  }

  RetryInterceptor _getRetryInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      retries: Constants.retryCount, // Number of retries before a failure
      retryDelays: [
        const Duration(milliseconds: Constants.retryDuration)
      ], // Interval between each retry
    );
  }

  InterceptorsWrapper _getInterceptorsWrapper() {
    return InterceptorsWrapper(
        onRequest: _requestInterceptor,
        onResponse: _responseInterceptor,
        onError: _errorInterceptor);
  }

  void _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    CustomLogger.instance.singleLine(
        'Request Interceptor:\nURL: ${options.uri}\nBaseURL: ${options.baseUrl}\nPath: ${options.path}\nQueryParams: ${options.queryParameters}\nMethod: ${options.method}\nHeaders: ${options.headers.toString()}\nData: ${options.data.toString()}');
    return requestInterceptorHandler.next(options);
  }

  void _errorInterceptor(
    DioError dioError,
    ErrorInterceptorHandler errorInterceptorHandler,
  ) async {
    CustomLogger.instance.error(
        'Error Interceptor: Error Received for Request:\nURL: ${dioError.requestOptions.uri}\n${dioError.requestOptions.baseUrl}\nPath: ${dioError.requestOptions.path}\nMethod: ${dioError.requestOptions.method}');
    CustomLogger.instance.error(
        'Error Interceptor: Status Code: ${dioError.response?.statusCode} \nError Response: ${dioError.response} \nStatus Message: ${dioError.response?.statusMessage}}');
    //If response is 401, then Call Refresh Token API, save new token in Shared Preference and retry current API call
    return errorInterceptorHandler.next(dioError);
  }

  void _responseInterceptor(
    Response response,
    ResponseInterceptorHandler responseInterceptorHandler,
  ) async {
    // log response
    CustomLogger.instance.response(
        'Response Interceptor:\nURL: ${response.requestOptions.uri}\nBaseURL: ${response.requestOptions.baseUrl}\nPATH: ${response.requestOptions.path}\nMethod: ${response.requestOptions.method}\n\nResponse:${response.toString()}');
    return responseInterceptorHandler.next(response);
  }

  static const JsonDecoder _decoder = JsonDecoder();

  static dynamic decodeResponse(d) {
    var response = d as Response?;

    if (response == null) {
      InfoToast(Constants.networkExceptionText);
      //ApiResponse Class handles empty map
      return {};
    }
    final dynamic jsonBody = response.data;

    if (jsonBody is String) {
      try {
        return _decoder.convert(jsonBody);
      } on FormatException catch (e) {
        CustomLogger.instance.error(e.toString());
        return {"message": "Format Exception  Occurred"};
      }
    } else {
      return jsonBody;
    }
  }
}
