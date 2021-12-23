import 'package:app/provider/agent_provider.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgentSearchField extends StatefulWidget {
  const AgentSearchField({Key? key}) : super(key: key);

  @override
  _AgentSearchFieldState createState() => _AgentSearchFieldState();
}

class _AgentSearchFieldState extends State<AgentSearchField> {
  final TextEditingController _searchController = TextEditingController();

  void _handleClear() async {
    await Provider.of<AgentProvider>(context, listen: false).search("");
    _searchController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 20.0, top: 40.0, bottom: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: SizeConfig.fitToHeight(20),
      child: Expanded(
        child: TextFormField(
          maxLines: 1,
          scrollPadding: EdgeInsets.zero,
          controller: _searchController,
          enabled: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          onChanged: (String? val) {
            Provider.of<AgentProvider>(context, listen: false)
                .search(_searchController.text);
            setState(() {});
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 18.0,
              color: Colors.black,
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? GestureDetector(
                    onTap: _handleClear,
                    child: const Icon(
                      Icons.close,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.all(10.0),
            fillColor: Colors.blueGrey.shade50,
            filled: true,
            hintText: "Search a Topic",
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
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
