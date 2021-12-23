import 'package:app/provider/agent_provider.dart';
import 'package:app/screens/talk_to_astrologer/widgets/sort_menu.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'agent_filter.dart';

class TalkToAstrologerHeader extends StatefulWidget {
  const TalkToAstrologerHeader({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerHeaderState createState() => _TalkToAstrologerHeaderState();
}

class _TalkToAstrologerHeaderState extends State<TalkToAstrologerHeader> {
  final TextEditingController _searchController = TextEditingController();
  bool _searchVisible = false;

  void _handleClear() async {
    await Provider.of<AgentProvider>(context, listen: false).search("");
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Talk to an Astrologer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset(
                    'assets/search.png',
                    width: SizeConfig.fitToWidth(20),
                    height: SizeConfig.fitToHeight(20),
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchVisible = !_searchVisible;
                    });
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset(
                    'assets/filter.png',
                    width: SizeConfig.fitToWidth(20),
                    height: SizeConfig.fitToHeight(20),
                    fit: BoxFit.fill,
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      builder: (ctx) {
                        return ChangeNotifierProvider.value(
                          value: Provider.of<AgentProvider>(context),
                          child: Consumer<AgentProvider>(
                            builder: (context, _provider, _) {
                              return AgentFilter(
                                  filterParams: _provider.filterParams);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                CustomPopupMenu(
                    child: Image.asset(
                      'assets/sort.png',
                      width: SizeConfig.fitToWidth(20),
                      height: SizeConfig.fitToHeight(20),
                      fit: BoxFit.fill,
                    ),
                    menuBuilder: () => ChangeNotifierProvider.value(
                          value: Provider.of<AgentProvider>(context),
                          child: const SortMenu(),
                        ),
                    pressType: PressType.singleClick)
              ],
            )
          ],
        ),
        if (_searchVisible) ...[
          Card(
            child: TextFormField(
              maxLines: 1,
              scrollPadding: EdgeInsets.zero,
              controller: _searchController,
              enabled: true,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              onChanged: (String? val) {
                Provider.of<AgentProvider>(context, listen: false)
                    .search(_searchController.text);
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: SizeConfig.fitToWidth(24),
                  color: AppTheme.primaryColor,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: _handleClear,
                        child: const Icon(
                          Icons.close,
                          size: 18.0,
                          color: AppTheme.primaryColor,
                        ),
                      )
                    : null,
                contentPadding: const EdgeInsets.all(10.0),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search a Agent",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintMaxLines: 1,
                alignLabelWithHint: true,
                hintStyle: const TextStyle(
                  color: Color(0xff687b9c),
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.fitToHeight(6),
          )
        ]
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
