import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageProvider>().getCurrentLocation();
    super.initState();
  }

  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Scaffold(
        appBar: AppBar(
          title: Text('Weather app'),
          actions: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                providerData.setSelectedItem(newValue);
              },
              items: providerData.items.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
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
