import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home_page_provider.dart';
import 'package:weather_app/widgets/hourly_card.dart';

import 'hourly_container.dart';

class HourlyListViewBuilder extends StatefulWidget {
  @override
  _HourlyListViewBuilderState createState() => _HourlyListViewBuilderState();
}

class _HourlyListViewBuilderState extends State<HourlyListViewBuilder> {
  int _selectedIndex = 0;

  void _setIndex(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: providerData.apiModel.hourly.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: HourlyCard(
                  apiModel: providerData.apiModel,
                  context: context,
                  index: index,
                ),
                onTap: () {
                  _setIndex(index);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(30),
                child: HourlyContainer(
                  context: context,
                  apiModel: providerData.apiModel,
                  index: _selectedIndex,
                )),
          ),
        ],
      ),
    );
  }
}
