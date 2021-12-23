import 'package:app/models/agent.dart';
import 'package:app/screens/talktoastro/functions/agent_skills.dart';
import 'package:app/utils/constants.dart';
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
      children: [
        Expanded(
            flex: 2,
            child: CachedNetworkImage(
                //According to the response we first check for medium size image
                //url , if it is null , we go for large , otherwise use default
                //agent image url
                imageUrl: agent.images.medium.imageUrl ??
                    agent.images.large.imageUrl ??
                    Constants.defaultAgentImage)),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Text(agent.getFormattedName()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/quality.png",
                    color: AppTheme.primaryColor,
                    width: SizeConfig.fitToWidth(16),
                  ),
                  Expanded(
                      child: Text(
                    getSkillsAsString(agent.skills),
                    style: const TextStyle(color: Colors.grey),
                  ))
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Text("${agent.experience.round()} Years"),
          flex: 2,
        )
      ],
    );
  }
}
