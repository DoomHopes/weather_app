import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/circular_progress_loading.dart';
import 'package:weather_app/widgets/dayly_list_view_builder.dart';
import 'package:weather_app/widgets/houry_list_view_builder.dart';

class HomePageProvider extends ChangeNotifier {
  ApiModel apiModel;

  static const _apiKey = '4d38180ec165390666ef08d99a2a52cb';

  double _lat;
  double _lon;

  Widget listViewBuilder() {
    if (apiModel == null) {
      getModelFromApi(_lat, _lon);
      return const CircularProgressLoading();
    } else {
      return DailyListViewBuilder();
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    _lat = position.latitude;
    _lon = position.longitude;
  }

  Future<void> getModelFromApi(double lat, double lon) async {
    apiModel = await getData(lat, lon);
    notifyListeners();
  }

  // lat = 30.5238000, lon = 50.4546600
  Future<ApiModel> getData(double lat, double lon) async {
    if (lat == null || lon == null) {
      lat = 50.588341299999996;
      lon = 30.5125639268269;
    }
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,current&appid=$_apiKey&units=metric';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic jsondata = json.decode(response.body);
      return ApiModel.fromJson(jsondata);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
