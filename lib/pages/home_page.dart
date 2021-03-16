import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home_page_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Scaffold(
        appBar: AppBar(
          title: Text('Wallpaper app'),
        ),
        body: Visibility(
          child: providerData.listViewBuilder('30.5167', '50.4333'),
        ),
      ),
    );
  }
}

//Center(child: Text('Here can be your advertising'),),
