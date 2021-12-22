import 'package:app/provider/panchang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanchangBody extends StatelessWidget {
  const PanchangBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanchangProvider>(
      builder: (context, _provider, _) {
        if (_provider.error != null) {
          return Center(
            child: Text(_provider.error!),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
