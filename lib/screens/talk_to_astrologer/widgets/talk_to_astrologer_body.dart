import 'package:app/provider/agent_provider.dart';
import 'package:app/screens/talk_to_astrologer/widgets/agent_card.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TalkToAstrologerBody extends StatefulWidget {
  const TalkToAstrologerBody({Key? key}) : super(key: key);

  @override
  State<TalkToAstrologerBody> createState() => _TalkToAstrologerBodyState();
}

class _TalkToAstrologerBodyState extends State<TalkToAstrologerBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AgentProvider>(builder: (context, _provider, _) {
      if (_provider.loading) {
        return SizedBox(
          height: SizeConfig.fitToHeight(300),
          width: double.infinity,
          child: Center(
            child: Lottie.asset("assets/anim/planet.json",
                fit: BoxFit.fitHeight, alignment: Alignment.center),
          ),
        );
      }
      if (_provider.error != null) {
        return SizedBox(
          height: SizeConfig.fitToHeight(250),
          child: Center(
              child: Text(
            _provider.error!,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          )),
        );
      }

      return ListView.separated(
        itemCount: _provider.agents.length,
        itemBuilder: (context, index) {
          return AgentCard(agent: _provider.agents[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      );
    });
  }
}
