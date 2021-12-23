import 'package:app/models/panchang/nakshatra.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class NakshatraWidget extends StatelessWidget {
  final Nakshatra nakshatra;

  const NakshatraWidget(this.nakshatra, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nakshatra",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Nakshatra Number", nakshatra.details.nakNumber.toString()),
        TextRow("Nakshatra Name", nakshatra.details.nakName),
        TextRow("Special", nakshatra.details.special),
        TextRow("Summary", nakshatra.details.summary),
        TextRow("Deity", nakshatra.details.deity),
        TextRow("End Time",
            "${nakshatra.endTime.hour}hr ${nakshatra.endTime.minute}min ${nakshatra.endTime.second}sec"),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
