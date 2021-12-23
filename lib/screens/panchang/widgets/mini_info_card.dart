import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MiniInfoCard extends StatelessWidget {
  final String asset, value, name;

  const MiniInfoCard(
      {Key? key, required this.asset, required this.value, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.fitToHeight(50),
      width: SizeConfig.fitToWidth(150),
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: SizeConfig.fitToWidth(24),
            color: AppTheme.blueColor,
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppTheme.blueColor,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
