import 'package:app/provider/agent_provider.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgentFilter extends StatefulWidget {
  final Map<String, dynamic> filterParams;

  const AgentFilter({Key? key, required this.filterParams}) : super(key: key);

  @override
  _AgentFilterState createState() => _AgentFilterState();
}

class _AgentFilterState extends State<AgentFilter> {
  late GroupController _languageController;

  late GroupController _skillsController;

  @override
  void initState() {
    super.initState();

    _languageController = GroupController(
      initSelectedItem: widget.filterParams["languages"] ?? [],
      isMultipleSelection: true,
    );
    _skillsController = GroupController(
      initSelectedItem: widget.filterParams["skills"] ?? [],
      isMultipleSelection: true,
    );
  }

  Widget _header() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Filter",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        GestureDetector(
          child: const Text(
            "RESET ALL",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          onTap: () {
            Provider.of<AgentProvider>(context, listen: false).filterAgents({});
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  Widget _filterByLanguage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        ),
        const Text(
          "By Language",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SimpleGroupedChips<String>(
          controller: _languageController,
          values: Constants.languages,
          itemTitle: Constants.languages,
          chipGroupStyle: const ChipGroupStyle(
              selectedTextColor: Colors.white,
              textColor: Colors.black,
              selectedColorItem: AppTheme.primaryColor,
              backgroundColorItem: AppTheme.greyColor),
          onItemSelected: (values) {
            Provider.of<AgentProvider>(context, listen: false).filterAgents({
              "languages": _languageController.selectedItem,
              "skills": _skillsController.selectedItem
            });
          },
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        )
      ],
    );
  }

  Widget _filterBySkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "By Skills",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SimpleGroupedChips<String>(
          controller: _skillsController,
          values: Constants.skills,
          itemTitle: Constants.skills,
          chipGroupStyle: const ChipGroupStyle(
              selectedTextColor: Colors.white,
              textColor: Colors.black,
              selectedColorItem: AppTheme.primaryColor,
              backgroundColorItem: AppTheme.greyColor),
          onItemSelected: (values) {
            Provider.of<AgentProvider>(context, listen: false).filterAgents({
              "languages": _languageController.selectedItem,
              "skills": _skillsController.selectedItem
            });
          },
        ),
        SizedBox(
          height: SizeConfig.fitToHeight(10),
        )
      ],
    );
  }

  Widget _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text(
            "Apply",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(primary: AppTheme.primaryColor),
          onPressed: () {
            Provider.of<AgentProvider>(context, listen: false).filterAgents({
              "languages": _languageController.selectedItem,
              "skills": _skillsController.selectedItem
            });
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8F8F8),
        boxShadow: <BoxShadow>[BoxShadow(color: AppTheme.greyColor)],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.fitToHeight(8),
        horizontal: SizeConfig.fitToWidth(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[300],
              ),
            ),
          ),
          _header(),
          _filterByLanguage(),
          _filterBySkills(),
          _submitButton(),
        ],
      ),
    );
  }
}
