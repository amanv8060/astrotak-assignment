import 'package:app/models/panchang/hindu_maah.dart';
import 'package:app/models/panchang/nakshool.dart';
import 'package:app/screens/panchang/widgets/text_row.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class HinduMaahWidget extends StatelessWidget {
  final HinduMaah hinduMaah;
  final String paksha;
  final String ritu;
  final String sunSign;
  final String moonSign;
  final String ayana;
  final String panchangYog;
  final int vikramSamvat;
  final String vikramSamvatName;
  final int shakaSamvat;
  final String shakaSamvatName;
  final String dishaShool;
  final String dishaShoolRemedies;
  final NakShool nakShool;
  final String moonNivas;

  const HinduMaahWidget(this.hinduMaah,
      {Key? key,
      required this.paksha,
      required this.ritu,
      required this.sunSign,
      required this.moonSign,
      required this.ayana,
      required this.panchangYog,
      required this.vikramSamvat,
      required this.vikramSamvatName,
      required this.shakaSamvat,
      required this.shakaSamvatName,
      required this.dishaShool,
      required this.dishaShoolRemedies,
      required this.nakShool,
      required this.moonNivas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hindu Maah",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        TextRow("Purnimanta", hinduMaah.purnimanta),
        TextRow("Amanta", hinduMaah.amanta),
        TextRow("Paksha", paksha),
        TextRow("Ritu", ritu),
        TextRow("Sun Sign", sunSign),
        TextRow("Moon Sign", moonSign),
        TextRow("Ayana", ayana),
        TextRow("Panchang yog", panchangYog),
        TextRow("Vikram Samvat", vikramSamvat.toString()),
        TextRow("Vikram Samvat Name", vikramSamvatName),
        TextRow("Shaka Samvat", shakaSamvat.toString()),
        TextRow("Shaka Samvat Name", shakaSamvatName),
        TextRow("Disha Shool", dishaShool),
        TextRow("Disha Shool Remedies", dishaShoolRemedies),
        TextRow("Nak Shool direction ", nakShool.direction),
        TextRow("Nak Shool remedies ", nakShool.remedies),
        TextRow("Moon Nivas", moonNivas),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
      ],
    );
  }
}
