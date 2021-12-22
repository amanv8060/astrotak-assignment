import 'package:app/models/api_response.dart';
import 'package:app/utils/network/request_helper.dart';

/// Repository to make panchang related api calls
class PanchangRepository {
  /// Expects a queryParam of type
  /// {
  /// "day":[int],
  /// "month":[int],
  /// "year":[int],
  /// "placeId" : [String]
  /// }
  Future<ApiResponse> getPanchang(Map<String, dynamic> queryParams) async {
    return RequestHelper.callAPI(
        RequestType.POST, '/horoscope/daily/panchang', 200,
        queryParams: queryParams);
  }
}
