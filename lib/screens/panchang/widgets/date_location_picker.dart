import 'package:app/models/place_model.dart';
import 'package:app/provider/panchang_provider.dart';
import 'package:app/provider/place_provider.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateLocationPicker extends StatefulWidget {
  const DateLocationPicker({Key? key}) : super(key: key);

  @override
  _DateLocationPickerState createState() => _DateLocationPickerState();
}

class _DateLocationPickerState extends State<DateLocationPicker> {
  /// To fetch Places
  final PlaceProvider _placeProvider = PlaceProvider();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  //setting default place to delhi , for now later on we can user location
  Place _selectedPlace = Place.fromJson(
      {"placeName": "Delhi, India", "placeId": "ChIJL_P_CXMEDTkRw0ZdG-0GVvw"});

  @override
  void initState() {
    _dateController.text =
        DateFormat("d MMMM , y").format(_selectedDate).toString();
    _placeController.text = _selectedPlace.placeName;
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            DateFormat("d MMMM , y").format(_selectedDate).toString();
      });
      update();
    }
  }

  ///Updates the Panchang Screen with the current values
  void update() async {
    Provider.of<PanchangProvider>(context, listen: false)
        .setData(_selectedDate, _selectedPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: const Color(0xfffdf2e9),
        height: SizeConfig.fitToHeight(150),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fitToWidth(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(flex: 3, child: Text("Date :")),
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      enabled: false,
                      controller: _dateController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.fitToHeight(10),
            ),
            Row(
              children: [
                const Expanded(flex: 3, child: Text("Location :")),
                Expanded(
                  flex: 7,
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _placeController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        filled: true,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return await _placeProvider
                          .getPlaces(_placeController.text);
                    },
                    itemBuilder: (context, Place suggestion) {
                      return ListTile(
                        title: Text(suggestion.placeName),
                      );
                    },
                    onSuggestionSelected: (Place suggestion) {
                      setState(() {
                        _selectedPlace = suggestion;
                        _placeController.text = suggestion.placeName;
                      });
                      update();
                    },
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
