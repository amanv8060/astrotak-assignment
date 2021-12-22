import 'package:app/models/api_response.dart';
import 'package:app/models/panchang.dart';
import 'package:app/models/place_model.dart';
import 'package:app/repository/panchang_repository.dart';
import 'package:app/repository/place_repository.dart';
import 'package:app/utils/logging/custom_logger.dart';
import 'package:flutter/cupertino.dart';

class PanchangProvider extends ChangeNotifier {
  Place? _selectedPlace;

  //Setting default DateTime as of now;
  DateTime _selectedDate = DateTime.now();
  String? error;
  bool loading = false;
  final PanchangRepository _panchangRepository = PanchangRepository();
  Panchang? data;

  Future<void> setData(DateTime date, Place place) async {
    _selectedDate = date;
    _selectedPlace = place;
    getPanchang();
  }

  Future<void> getPanchang() async {
    loading = true;
    notifyListeners();
    if (_selectedPlace == null) {
      error = "Please Select Place";
      loading = false;
      notifyListeners();
      return;
    }

    //payload for api
    Map<String, dynamic> queryParams = {
      "day": _selectedDate.day,
      "month": _selectedDate.month,
      "year": _selectedDate.year,
      "placeId": _selectedPlace!.placeId,
    };

    ApiResponse response = await _panchangRepository.getPanchang(queryParams);
    if (response.success) {
      //return empty list when there is no data
      if (response.data == null) {
        error = response.message;
        loading = false;
        notifyListeners();
        return;
      }
      error = null;
      data = Panchang.fromJson(response.data);
    } else {
      error = response.message;
    }
    loading = false;
    notifyListeners();
  }
}
