import 'package:app/models/api_response.dart';
import 'package:app/models/place_model.dart';
import 'package:app/repository/place_repository.dart';
import 'package:app/utils/logging/custom_logger.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

///Provides the list of places to the
class PlaceProvider extends ChangeNotifier {
  final PlaceRepository _placeRepository = PlaceRepository();

  Future<void> getPlaces(String place) async {
    ApiResponse response = await _placeRepository.getPlaceList(place);
    if (response.status) {
      if (response.data != null) {
        print(response.data.toString());
      }
    } else {
      CustomLogger.instance.error(response.message);
    }
  }
}
