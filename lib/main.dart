import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:weather_app/pages/splash_page.dart';
import 'dart:ui' as ui;

import 'providers/home_page_provider.dart';

void main() {
  initAllForApp();
  runApp(MyApp());
}

Future<void> initAllForApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ApiModelAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(DailyAdapter());
  Hive.registerAdapter(RainAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(FeelsLikeAdapter());
  Hive.registerAdapter(TempAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
        )
      ],
      child: MaterialApp(
        locale: ui.window.locale,
        title: 'Weather App',
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
