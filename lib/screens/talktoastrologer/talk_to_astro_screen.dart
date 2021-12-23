import 'package:app/provider/agent_provider.dart';
import 'package:app/screens/talktoastrologer/widgets/talk_to_astrologer_body.dart';
import 'package:app/screens/talktoastrologer/widgets/talk_to_astrologer_header.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkToAstrologer extends StatefulWidget {
  const TalkToAstrologer({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerState createState() => _TalkToAstrologerState();
}

class _TalkToAstrologerState extends State<TalkToAstrologer> {
  final AgentProvider _agentProvider = AgentProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _agentProvider,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.fitToWidth(8)),
        child: Column(children: const [
          TalkToAstrologerHeader(),
          Expanded(child: TalkToAstrologerBody()),
        ]),
      ),
    );
  }
}
