import 'package:app/screens/panchang/widgets/mini_info_card.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class MiniInfoRow extends StatelessWidget {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String ritu;
  final String ayana;

  const MiniInfoRow({
    Key? key,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.ritu,
    required this.ayana,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.fitToHeight(54),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.grey,
            )
          ],
          borderRadius: BorderRadius.circular(6)),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.fitToHeight(5)),
        scrollDirection: Axis.horizontal,
        children: [
          MiniInfoCard(
              asset: "assets/icons/sun.png", value: sunrise, name: "Sunrise"),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          MiniInfoCard(
              asset: "assets/icons/sun.png", value: sunset, name: "Sunset"),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          MiniInfoCard(
              asset: "assets/icons/moon.png",
              value: moonrise,
              name: "MoonRise"),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          MiniInfoCard(
              asset: "assets/icons/moon.png", value: moonset, name: "MoonSet"),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          MiniInfoCard(
              asset: "assets/icons/ayana.png", value: ayana, name: "Ayana"),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          MiniInfoCard(
              asset: "assets/icons/ritu.png", value: ritu, name: "Ritu"),
        ],
      ),
    );
  }
}
