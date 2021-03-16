import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper app',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
