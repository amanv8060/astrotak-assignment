import 'package:app/models/place_model.dart';
import 'package:app/provider/place_provider.dart';
import 'package:app/utils/size_config.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';

class DateLocationPicker extends StatefulWidget {
  const DateLocationPicker({Key? key}) : super(key: key);

  @override
  _DateLocationPickerState createState() => _DateLocationPickerState();
}

class _DateLocationPickerState extends State<DateLocationPicker> {
  PlaceProvider _placeProvider = PlaceProvider();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    _placeProvider.getPlaces("Delhi");
    _dateController.text =
        DateFormat("d MMMM , y").format(_selectedDate).toString();
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
    }
  }

  Future<List<Place>> getPlaces() async {
    List<Place> _places = await _placeProvider.getPlaces(_placeController.text);

    return _places;
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
                          const TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.start,
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
                Expanded(flex: 3, child: Text("Location :")),
                // Expanded(
                //   flex: 7,
                //   // child:
                //   // DropdownSearch<Place>(
                //   //   onFind: (String? filter) async {
                //   //     return _placeProvider.getPlaces(filter ?? "");
                //   //   },
                //   //   onChanged: (Place? data) {
                //   //     print(data);
                //   //   },
                //   //   showSearchBox: true,
                //   //   mode: Mode.MENU,
                //   //                 )
                //   // )
                //   //
                //   //
                //   //
                //   //     TextFieldSearch(
                //   //   textStyle:
                //   //       const TextStyle(fontSize: 18, color: Colors.black87),
                //   //   controller: _placeController,
                //   //   future: () {
                //   //     return getPlaces();
                //   //   },
                //   //   decoration: const InputDecoration(
                //   //     fillColor: Colors.white,
                //   //     enabledBorder: InputBorder.none,
                //   //     border: InputBorder.none,
                //   //     filled: true,
                //   //   ),
                //   // ),
                //   // TextFormField(
                //   //   style:
                //   //   textAlign: TextAlign.start,
                //   //   enabled: true,
                //   //   keyboardType: TextInputType.text,
                //   //   controller: _placeController,
                //   //
                //   // ),
                // ),
                //
              ],
            ),
          ],
        ));
  }
}
