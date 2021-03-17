import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';

import 'hourly_detailed.dart';

class HourlyListViewBuilder extends StatelessWidget {
  final ApiModel apiModel;
  HourlyListViewBuilder({this.apiModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiModel.hourly.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blueAccent,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  constraints: BoxConstraints.tightFor(width: 80.0),
                  child: Image.network('http://openweathermap.org/img/wn/' +
                      apiModel.hourly[index].weather[0].icon +
                      '.png'),
                ),
                title: Text(
                  apiModel.hourly[index].dt.day.toString() +
                      '.' +
                      apiModel.hourly[index].dt.month.toString() +
                      '.' +
                      apiModel.hourly[index].dt.year.toString() +
                      ' ' +
                      apiModel.hourly[index].dt.hour.toString() +
                      ':' +
                      apiModel.hourly[index].dt.minute.toString() +
                      '0',
                ),
                subtitle: Text(S.of(context).Temperature +
                    apiModel.hourly[index].temp.toStringAsFixed(0) +
                    '°'),
                onTap: () {
                  showDialog(
                    context: context,
                    child: HourlyDetailed(
                      apiModel: apiModel,
                      index: index,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
