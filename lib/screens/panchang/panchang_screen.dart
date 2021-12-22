import 'package:app/provider/panchang_provider.dart';
import 'package:app/screens/panchang/widgets/date_location_picker.dart';
import 'package:app/screens/panchang/widgets/panchang_body.dart';
import 'package:app/screens/panchang/widgets/panchang_header.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanchangScreen extends StatefulWidget {
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  _PanchangScreenState createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  final PanchangProvider _panchangProvider = PanchangProvider();

  @override
  void initState() {
    super.initState();
    _panchangProvider.getPanchang();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.fitToWidth(16)),
      child: ChangeNotifierProvider.value(
        value: _panchangProvider,
        child: Column(
          children: [const PanchangHeader(), DateLocationPicker()],
        ),
      ),
    );
  }
}
