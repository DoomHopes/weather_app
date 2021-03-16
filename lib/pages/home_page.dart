import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home_page_provider.dart';
import 'package:weather_app/utils/connection_checker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ConnectionChecker().checkConnection(context);
    context.read<HomePageProvider>().getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    ConnectionChecker().listener.cancel();
    super.dispose();
  }

  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Scaffold(
        appBar: AppBar(
          title: Text('Weather app'),
        ),
        body: Visibility(
          child: providerData.listViewBuilder(),
        ),
      ),
    );
  }
}

//Center(child: Text('Here can be your advertising'),),
