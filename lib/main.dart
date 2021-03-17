import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:weather_app/pages/splash_page.dart';
import 'dart:ui' as ui;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

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

Locale checkLocale() {
  String locale =
      Locale(ui.window.locale.toString().replaceRange(2, 5, '')).toString();
  if (locale == 'ru') {
    return Locale('ru');
  } else {
    return Locale('en');
  }
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
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: checkLocale(),
        title: 'Weather App',
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
