import 'package:app/provider/agent_provider.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortMenu extends StatelessWidget {
  const SortMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AgentProvider>(builder: (context, _provider, _) {
      return Container(
        padding: EdgeInsets.only(
            left: SizeConfig.fitToWidth(20), right: SizeConfig.fitToWidth(20)),
        width: SizeConfig.fitToWidth(300),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.fitToHeight(8),
            ),
            Row(
              children: const [
                Text(
                  "Sort By",
                  style: TextStyle(color: AppTheme.primaryColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.fitToHeight(8),
            ),
            Divider(
              height: SizeConfig.fitToHeight(2),
              color: Colors.grey,
            ),
            RadioListTile(
              contentPadding: const EdgeInsets.all(0),
              value: SortOrder.EXP_ASC,
              groupValue: _provider.sortOrder,
              onChanged: (SortOrder? order) {
                _provider.sortOrder = order;
                _provider.sort();
              },
              title: const Text(
                "Experience- low to high",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            RadioListTile(
              contentPadding: const EdgeInsets.all(0),
              value: SortOrder.EXP_DSC,
              groupValue: _provider.sortOrder,
              onChanged: (SortOrder? order) {
                _provider.sortOrder = order;
                _provider.sort();
              },
              title: const Text(
                "Experience- high to low",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            RadioListTile(
              contentPadding: const EdgeInsets.all(0),
              value: SortOrder.PRICE_DSC,
              groupValue: _provider.sortOrder,
              onChanged: (SortOrder? order) {
                _provider.sortOrder = order;
                _provider.sort();
              },
              title: const Text(
                "Price- high to low",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            RadioListTile(
              contentPadding: const EdgeInsets.all(0),
              value: SortOrder.PRICE_ASC,
              groupValue: _provider.sortOrder,
              onChanged: (SortOrder? order) {
                _provider.sortOrder = order;
                _provider.sort();
              },
              title: const Text(
                "Price- low to high",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    });
  }
}
