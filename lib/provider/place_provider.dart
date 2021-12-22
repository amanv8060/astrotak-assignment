import 'package:app/models/api_response.dart';
import 'package:app/models/place_model.dart';
import 'package:app/repository/place_repository.dart';
import 'package:app/utils/logging/custom_logger.dart';
import 'package:flutter/material.dart';

///Provides the list of places to the
class PlaceProvider extends ChangeNotifier {
  final PlaceRepository _placeRepository = PlaceRepository();

  Future<List<Place>> getPlaces(String place) async {
    ApiResponse response = await _placeRepository.getPlaceList(place);
    if (response.success) {
      //return empty list when there is no data
      if (response.data == null) return <Place>[];

      List<dynamic> data = response.data as List;
      return data.map((e) => Place.fromJson(e)).toList();
    } else {
      CustomLogger.instance.error(response.message);
      return <Place>[];
    }
  }
}
