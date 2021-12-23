import 'package:app/models/panchang/muhurta.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class MuhurtaWidget extends StatelessWidget {
  final String name;
  final Muhurta muhurta;

  const MuhurtaWidget({Key? key, required this.name, required this.muhurta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Start", muhurta.start),
        TextRow("End", muhurta.end),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
