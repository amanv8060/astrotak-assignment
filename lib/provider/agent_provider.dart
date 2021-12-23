import 'package:app/models/agent.dart';
import 'package:app/models/api_response.dart';
import 'package:app/repository/agent_repository.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/logging/custom_logger.dart';
import 'package:app/utils/sort_agents.dart';
import 'package:flutter/cupertino.dart';

// ignore: constant_identifier_names
enum SortOrder { EXP_ASC, EXP_DSC, PRICE_ASC, PRICE_DSC }

class AgentProvider extends ChangeNotifier {
  ///Used to store the original list of agents from API
  //ignore: prefer_final_fields
  List<Agent> _agents = <Agent>[];

  ///Stores the _lastSearchedString , to optimize searching of items
  String _lastSearched = "";

  bool loading = false;
  String? error;

  /// List of [Agent] to be utilized by UI
  List<Agent> agents = List.empty();

  ///order in which [agents] should be order
  SortOrder? sortOrder;

  /// to make agent api related calls
  final AgentRepository _agentRepository = AgentRepository();

  //Todo: Write this function
  /// This functions updates [agents] according to the option selected by a user ,
  /// If user resets the option , we reinitialize the list , else we sort accordingly
  updateQueryParams(Map<String, dynamic> params) async {
    if (params.isEmpty) {
      refreshList();
      notifyListeners();
    } else {}
    notifyListeners();
  }

  ///Sorts the agent list in the given order
  sort(SortOrder order) {
    sortOrder = order;
    sortAgents(agents, sortOrder!);
    notifyListeners();
  }

  /// refreshes the agent list while maintaining the sort order
  refreshList() async {
    agents = _agents;
    if (sortOrder != null) {
      sortAgents(agents, sortOrder!);
    }
  }

  /// Modifies agents where the agent name contains the entered name
  Future<void> search(String toSearch) async {
    toSearch = toSearch.toLowerCase();

    // if parameter starts with my previous search
    if (_lastSearched != "" && toSearch.startsWith(_lastSearched)) {
      CustomLogger.instance.singleLine("Matched Previous Search");
      _lastSearched = toSearch;
      agents = agents
          .where((element) =>
              element.getFormattedName().toLowerCase().contains(toSearch))
          .toList();
      notifyListeners();
      return;
    }

    _lastSearched = toSearch;
    refreshList();
    agents = agents
        .where((element) =>
            element.getFormattedName().toLowerCase().contains(toSearch))
        .toList();
    notifyListeners();
  }

  void fetchAgents() async {
    loading = true;
    notifyListeners();
    ApiResponse response = await _agentRepository.getAgentList({});
    if (response.success) {
      if (response.data == null) {
        error = Constants.unknownExceptionText;
        loading = false;
        notifyListeners();
      }
      List<dynamic> data = response.data as List;
      agents = data.map((e) => Agent.fromJson(e)).toList();
    } else {
      error = response.message;
    }
    loading = false;
    notifyListeners();
  }
}
