import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String title, value;

  const TextRow(
    this.title,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.fitToHeight(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(color: Colors.grey),
              )),
          Expanded(
              flex: 6,
              child: Text(
                value,
                style: const TextStyle(color: Colors.grey),
              ))
        ],
      ),
    );
  }
}
