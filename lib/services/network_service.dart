import 'package:app/utils/network/network_common.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final Dio _client = NetworkCommon().getClient();

  Dio get client => _client;
}
