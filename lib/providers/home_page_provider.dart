import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/database/database_hive.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/circular_progress_loading.dart';
import 'package:weather_app/widgets/daily_list_view_builder.dart';
import 'package:weather_app/widgets/hourly_list_view_builder.dart';
import 'package:connectivity/connectivity.dart';

class HomePageProvider extends ChangeNotifier {
  ApiModel apiModel;

  static const _apiKey = '4d38180ec165390666ef08d99a2a52cb';

  final hive = DataBaseHive();

  double _lat;
  double _lon;

  bool connection;

  int dropDownItem = 1;

  void changeItem(int value) {
    dropDownItem = value;
    notifyListeners();
  }

  // ignore: missing_return
  Widget listViewBuilder() {
    if (apiModel == null) {
      getMainPageAndScheme();
      return const CircularProgressLoading();
    } else if (dropDownItem == 1) {
      return DailyListViewBuilder(apiModel: apiModel);
    } else if (dropDownItem == 2) {
      return HourlyListViewBuilder();
    }
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<void> getMainPageAndScheme() async {
    connection = await check();
    if (connection == true) {
      await getModelFromApi();
    } else if (connection == false) {
      getModelFromHive();
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    _lat = position.latitude;
    _lon = position.longitude;
  }

  void getModelFromHive() {
    apiModel = hive.getModel();
    notifyListeners();
  }

  Future<void> getModelFromApi() async {
    apiModel = await getData();
    hive.addModel(apiModel);
    notifyListeners();
  }

  // lat = 50.588341299999996, lon = 30.5125639268269
  Future<ApiModel> getData() async {
    if (_lat == null || _lon == null) {
      _lat = 50.588341299999996;
      _lon = 30.5125639268269;
    }
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$_lat&lon=$_lon&exclude=minutely,current&appid=$_apiKey&units=metric';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic jsondata = json.decode(response.body);
      return ApiModel.fromJson(jsondata);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
