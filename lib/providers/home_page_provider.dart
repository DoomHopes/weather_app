import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/circular_progress_loading.dart';
import 'package:weather_app/widgets/dayly_list_view_builder.dart';
import 'package:weather_app/widgets/houry_list_view_builder.dart';

class HomePageProvider extends ChangeNotifier {
  ApiModel _apiModel;
  static const _apiKey = '4d38180ec165390666ef08d99a2a52cb';

  double _lat;
  double _lon;

  Widget listViewBuilder() {
    if (_apiModel == null) {
      getCurrentLocation();
      getModelFromApi(_lat, _lon);
      return const CircularProgressLoading();
    } else {
      return DaylyListViewBuilder(
        apiModel: _apiModel,
      );
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      _lat = position.latitude;
      _lon = position.longitude;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getModelFromApi(double lat, double lon) async {
    _apiModel = await getData(lat, lon);
    notifyListeners();
  }

  // lat = 30.5167, lon = 50.4333
  Future<ApiModel> getData(double lat, double lon) async {
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$_apiKey&units=metric';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic jsondata = json.decode(response.body);
      return ApiModel.fromJson(jsondata);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
