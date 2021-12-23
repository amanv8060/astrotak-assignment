import 'package:app/models/agent.dart';
import 'package:app/models/api_response.dart';
import 'package:app/repository/agent_repository.dart';
import 'package:app/screens/talk_to_astrologer/functions/filter_agents.dart';
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

  /// flag to show loading in progress
  bool loading = false;

  ///Stores error message if there is any error
  String? error;

  ///Stores on what filters the current list is filtered
  ///Structure
  ///{
  ///"languages" : List<String>
  ///"skills" : List<String>
  ///}
  Map<String, dynamic> filterParams = {};

  /// List of [Agent] to be utilized by UI
  List<Agent> agents = List.empty();

  ///order in which [agents] should be order
  SortOrder? sortOrder;

  /// to make agent api related calls
  final AgentRepository _agentRepository = AgentRepository();

  AgentProvider() {
    fetchAgents();
  }

  /// This functions updates [agents] according to the option selected by a user ,
  /// If user resets the option , we reinitialize the list , else we sort accordingly
  filter(Map<String, dynamic> params) async {
    filterParams = params;
    if (params.isEmpty) {
      refreshList();
    } else {
      if ((params["languages"] == null || params["languages"].length == 0) &&
          (params["skills"] == null || params["skills"].length == 0)) {
        refreshList();
      } else {
        agents = filterAgents(agents, params);
      }
    }
    notifyListeners();
  }

  ///Sorts the agent list in the given order
  sort() {
    if (sortOrder == null) {
      return;
    }
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
    filter(filterParams);
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
        return;
      }
      List<dynamic> data = response.data as List;
      _agents = data.map((e) => Agent.fromJson(e)).toList();
      agents = _agents;
    } else {
      error = response.message;
    }
    loading = false;
    notifyListeners();
  }
}
