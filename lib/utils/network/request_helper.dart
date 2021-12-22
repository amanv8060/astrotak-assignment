import 'package:app/models/api_response.dart';
import 'package:app/services/network_service.dart';
import 'package:app/utils/get_it/locator.dart';
import 'package:dio/dio.dart';

import '../constants.dart';
import 'network_common.dart';

// ignore: constant_identifier_names
enum RequestType { GET, POST, PATCH, PUT }

class RequestHelper {
  static Future<ApiResponse> callAPI(
      RequestType requestType, String path, int expectedStatusCode,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      String? baseUrl}) async {
    Dio _client = locator<NetworkService>().client;
    _client.options.baseUrl = (baseUrl ?? Constants.apiEndPoint)!;
    try {
      Response? response;
      switch (requestType) {
        case RequestType.GET:
          response = await _client.get(path, queryParameters: queryParams);
          break;
        case RequestType.POST:
          response = await _client.post(path,
              data: data, queryParameters: queryParams);
          break;
        case RequestType.PATCH:
          response = await _client.patch(path,
              data: data, queryParameters: queryParams);
          break;
        case RequestType.PUT:
          response =
              await _client.put(path, data: data, queryParameters: queryParams);
          break;
      }
      print(response.data);
      return ApiResponse(response.statusCode == expectedStatusCode,
          NetworkCommon.decodeResponse(response));
    } on DioError catch (e) {
      return ApiResponse.error(
          NetworkCommon.decodeResponse(e.response)["message"]);
    }
  }
}
