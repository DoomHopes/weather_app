import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/widgets/hourly_card.dart';

import 'hourly_container.dart';

class HourlyListViewBuilder extends StatefulWidget {
  final ApiModel apiModel;
  HourlyListViewBuilder({this.apiModel});

  @override
  _HourlyListViewBuilderState createState() => _HourlyListViewBuilderState();
}

class _HourlyListViewBuilderState extends State<HourlyListViewBuilder> {
  int _selectedIndex = 0;

  void setIndex(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.apiModel.hourly.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: HourlyCard(
                apiModel: widget.apiModel,
                context: context,
                index: index,
              ),
              onTap: () {
                setIndex(index);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(30),
              child: HourlyContainer(
                context: context,
                apiModel: widget.apiModel,
                index: _selectedIndex,
              )),
        ),
      ],
    );
  }
}
