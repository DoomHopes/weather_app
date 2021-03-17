import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/splash_page.dart';
import 'dart:ui' as ui;

import 'providers/home_page_provider.dart';

void main() {
  runApp(MyApp());
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
        initialRoute: '/first',
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        routes: {
          '/first': (context) => SplashScreen(),
        },
      ),
    );
  }
}
