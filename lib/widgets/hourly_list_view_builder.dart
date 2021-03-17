import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/providers/home_page_provider.dart';

import 'hourly_detailed.dart';

class HourlyListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => ListView.builder(
        itemCount: providerData.apiModel.hourly.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    constraints: BoxConstraints.tightFor(width: 80.0),
                    child: Image.network('http://openweathermap.org/img/wn/' +
                        providerData.apiModel.hourly[index].weather[0].icon +
                        '.png'),
                  ),
                  title: Text(providerData.apiModel.hourly[index].dt
                      .toString()
                      .replaceFirst('.000', '')),
                  subtitle: Text(S.of(context).Temperature +
                      providerData.apiModel.hourly[index].temp
                          .toStringAsFixed(0) +
                      '°'),
                  onTap: () {
                    showDialog(
                      context: context,
                      child: HourlyDetailed(
                        apiModel: providerData.apiModel,
                        index: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
