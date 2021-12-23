import 'package:app/models/panchang/tithi.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class TithiWidget extends StatelessWidget {
  final Tithi tithi;

  const TithiWidget(
    this.tithi, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tithi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Tithi Number", tithi.details.tithiNumber.toString()),
        TextRow("Tithi Name", tithi.details.tithiName),
        TextRow("Special", tithi.details.special),
        TextRow("Summary", tithi.details.summary),
        TextRow("Deity", tithi.details.deity),
        TextRow("End Time",
            "${tithi.endTime.hour}hr ${tithi.endTime.minute}min ${tithi.endTime.second}sec"),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
