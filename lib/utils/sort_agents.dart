import 'package:app/models/agent.dart';
import 'package:app/provider/agent_provider.dart';

void sortAgents(List<Agent> agents, SortOrder sortOrder) {
  switch (sortOrder) {
    case SortOrder.EXP_ASC:
      agents.sort((a, b) {
        if (a.experience <= b.experience) {
          return -1;
        } else {
          return 1;
        }
      });
      break;
    case SortOrder.EXP_DSC:
      agents.sort((a, b) {
        if (a.experience >= b.experience) {
          return -1;
        } else {
          return 1;
        }
      });
      break;

    case SortOrder.PRICE_ASC:
      agents.sort((a, b) {
        if (a.additionalPerMinuteCharges <= b.additionalPerMinuteCharges) {
          return -1;
        } else {
          return 1;
        }
      });
      break;
    case SortOrder.PRICE_DSC:
      agents.sort((a, b) {
        if (a.additionalPerMinuteCharges >= b.additionalPerMinuteCharges) {
          return -1;
        } else {
          return 1;
        }
      });
      break;
  }
}
