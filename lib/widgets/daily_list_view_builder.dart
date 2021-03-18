import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/home_page_provider.dart';
import 'package:weather_app/widgets/daily_container.dart';

import 'daily_card.dart';

class DailyListViewBuilder extends StatefulWidget {
  @override
  _DailyListViewBuilderState createState() => _DailyListViewBuilderState();
}

class _DailyListViewBuilderState extends State<DailyListViewBuilder> {
  int _selectedIndex = 0;

  void setIndex(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  // ignore: missing_return
  String winDir(int degree, BuildContext con) {
    if (degree >= 0 || degree <= 30) {
      return S.of(con).Northern;
    } else if (degree >= 31 || degree <= 60) {
      return S.of(con).Northeastern;
    } else if (degree >= 61 || degree <= 120) {
      return S.of(con).Southeastern;
    } else if (degree >= 121 || degree <= 150) {
      return S.of(con).Eastern;
    } else if (degree >= 151 || degree <= 210) {
      return S.of(con).Southeastern;
    } else if (degree >= 211 || degree <= 240) {
      return S.of(con).South;
    } else if (degree >= 241 || degree <= 300) {
      return S.of(con).Southwestern;
    } else if (degree >= 301 || degree <= 330) {
      return S.of(con).Northwestern;
    } else if (degree >= 331 || degree <= 360) {
      return S.of(con).Northern;
    }
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
              itemCount: providerData.apiModel.daily.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: DailyCard(
                  apiModel: providerData.apiModel,
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
              child: DailyContainer(
                apiModel: providerData.apiModel,
                context: context,
                index: _selectedIndex,
                function: winDir,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
