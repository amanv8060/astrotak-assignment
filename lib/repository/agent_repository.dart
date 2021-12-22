import 'package:app/models/api_response.dart';
import 'package:app/utils/network/request_helper.dart';

/// Repository to make agent related api calls
class AgentRepository {
  Future<ApiResponse> getAgentList(Map<String, dynamic> queryParams) async {
    return RequestHelper.callAPI(RequestType.GET, '/agent/all/', 200,
        queryParams: queryParams);
  }
}
