import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class PanchangHeader extends StatelessWidget {
  const PanchangHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            Text(
              "Daily Panchang",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        const Text(
          "India is a country known for its festival but knowing the exact"
          " dates can sometimes be difficult. To ensure you do not miss "
          "our on the critical dates we bring you the daily panchang.",
          textAlign: TextAlign.justify,
          style: TextStyle(color: Color(0xffa0a0a0)),
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(8),
        )
      ],
    );
  }
}
