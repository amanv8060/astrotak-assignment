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

  final PanchangHeader _panchangHeader = const PanchangHeader();
  final DateLocationPicker _dateLocationPicker = const DateLocationPicker();
  final PanchangBody _panchangBody = const PanchangBody();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _panchangProvider,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.fitToWidth(16)),
        children: [_panchangHeader, _dateLocationPicker, _panchangBody],
      ),
    );
  }
}
