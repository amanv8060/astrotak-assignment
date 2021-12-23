import 'package:app/models/panchang/karan.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

///Renders the data of [Karan]
class KaranWidget extends StatelessWidget {
  final Karan karan;

  const KaranWidget(this.karan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Karan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Karan Number", karan.details.karanNumber.toString()),
        TextRow("Karan Name", karan.details.karanName),
        TextRow("Special", karan.details.special),
        TextRow("Deity", karan.details.deity),
        TextRow("End Time",
            "${karan.endTime.hour}hr ${karan.endTime.minute}min ${karan.endTime.second}sec"),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
