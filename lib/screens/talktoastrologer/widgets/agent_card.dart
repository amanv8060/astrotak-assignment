import 'package:app/models/agent.dart';
import 'package:app/screens/talktoastrologer/functions/agent_language.dart';
import 'package:app/screens/talktoastrologer/functions/agent_skills.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/logging/info_toast.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Renders individual agent card
class AgentCard extends StatelessWidget {
  /// Agents details that are supposed to be displayed
  final Agent agent;

  const AgentCard({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: CachedNetworkImage(
                //According to the response we first check for medium size image
                //url , if it is null , we go for large , otherwise use default
                //agent image url
                imageUrl: agent.images.medium.imageUrl ??
                    agent.images.large.imageUrl ??
                    Constants.defaultAgentImage)),
        SizedBox(
          width: SizeConfig.fitToWidth(8),
        ),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                agent.getFormattedName(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.fitToHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/quality.png",
                    color: AppTheme.primaryColor,
                    width: SizeConfig.fitToWidth(16),
                  ),
                  SizedBox(
                    width: SizeConfig.fitToWidth(6),
                  ),
                  Expanded(
                      child: Text(
                    getSkillsAsString(agent.skills),
                    style: const TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              SizedBox(
                height: SizeConfig.fitToHeight(6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/translate.png",
                    color: AppTheme.primaryColor,
                    width: SizeConfig.fitToWidth(16),
                  ),
                  SizedBox(
                    width: SizeConfig.fitToWidth(6),
                  ),
                  Expanded(
                      child: Text(
                    getLanguagesAsString(agent.languages),
                    style: const TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              SizedBox(
                height: SizeConfig.fitToHeight(6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/bill.png",
                    color: AppTheme.primaryColor,
                    width: SizeConfig.fitToWidth(16),
                  ),
                  SizedBox(
                    width: SizeConfig.fitToWidth(6),
                  ),
                  Expanded(
                      child: Text(
                    "₹ ${agent.additionalPerMinuteCharges.round()}/ Min",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(primary: AppTheme.primaryColor),
                  onPressed: () {
                    InfoToast("Talk on Call pressed");
                  },
                  icon: const Icon(Icons.call),
                  label: const Text(
                    "Talk on Call",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: SizeConfig.fitToHeight(10),
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.fitToWidth(8),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${agent.experience.round()} Years",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          flex: 2,
        )
      ],
    );
  }
}
