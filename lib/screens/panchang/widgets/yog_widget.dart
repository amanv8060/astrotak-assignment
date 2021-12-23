import 'package:app/models/panchang/yog.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class YogWidget extends StatelessWidget {
  final Yog yog;

  const YogWidget(this.yog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Yog",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Yog Number", yog.details.yogNumber.toString()),
        TextRow("Yog Name", yog.details.yogName),
        TextRow("Special", yog.details.special),
        TextRow("Meaning", yog.details.meaning),
        TextRow("End Time",
            "${yog.endTime.hour}hr ${yog.endTime.minute}min ${yog.endTime.second}sec"),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
