import 'package:app/provider/place_provider.dart';
import 'package:flutter/material.dart';

class DateLocationPicker extends StatefulWidget {
  const DateLocationPicker({Key? key}) : super(key: key);

  @override
  _DateLocationPickerState createState() => _DateLocationPickerState();
}

class _DateLocationPickerState extends State<DateLocationPicker> {
  PlaceProvider _placeProvider = PlaceProvider();

  @override
  void initState() {
    _placeProvider.getPlaces("Delhi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hey"),
    );
  }
}
