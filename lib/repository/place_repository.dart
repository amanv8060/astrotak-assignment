import 'package:app/models/api_response.dart';
import 'package:app/utils/network/request_helper.dart';

///Repository to fetch places from places api
class PlaceRepository {
  Future<ApiResponse> getPlaceList(String place) async {
    return RequestHelper.callAPI(
        RequestType.GET, '/location/place?inputPlace=$place', 200);
  }
}
