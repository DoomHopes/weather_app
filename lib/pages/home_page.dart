import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 1;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    Hive.openBox<ApiModel>('modelbox');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Scaffold(
        appBar: AppBar(
          title: Text(dateTime.day.toString() +
              '.' +
              dateTime.month.toString() +
              '.' +
              dateTime.year.toString()),
          actions: <Widget>[
            DropdownButton<int>(
              value: _value,
              dropdownColor: Colors.blueAccent,
              items: <DropdownMenuItem<int>>[
                DropdownMenuItem(
                  child: Text(
                    S.of(context).Daily,
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text(
                    S.of(context).Hourly,
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 2,
                ),
              ],
              onChanged: (int value) {
                setState(() => _value = value);
                providerData.changeItem(value);
              },
            )
          ],
        ),
        body: Visibility(
          child: providerData.listViewBuilder(),
        ),
      ),
    );
  }
}

//Center(child: Text('Here can be your advertising'),),
