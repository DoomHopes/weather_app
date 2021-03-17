import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/widgets/daily_detailed.dart';

class DailyListViewBuilder extends StatelessWidget {
  final ApiModel apiModel;
  DailyListViewBuilder({this.apiModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiModel.daily.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blueAccent,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  constraints: BoxConstraints.tightFor(width: 80.0),
                  child: Image.network('http://openweathermap.org/img/wn/' +
                      apiModel.daily[index].weather[0].icon +
                      '@2x.png'),
                ),
                title: Text(apiModel.daily[index].dt
                    .toString()
                    .replaceFirst('.000', '')),
                subtitle: Text(S.of(context).DaytimeTemperature +
                    apiModel.daily[index].temp.day.toStringAsFixed(0) +
                    '°'),
                onTap: () {
                  showDialog(
                    context: context,
                    child: DailyDetailed(
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
