import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/api_model.dart';

class HourlyListViewBuilder extends StatelessWidget {
  final ApiModel apiModel;

  HourlyListViewBuilder({this.apiModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiModel.hourly.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  constraints: BoxConstraints.tightFor(width: 80.0),
                  child: Image.network('http://openweathermap.org/img/wn/' +
                      apiModel.hourly[index].weather[0].icon +
                      '.png'),
                ),
                title: Text(apiModel.hourly[index].dt.toString()),
              ),
            ],
          ),
        );
      },
    );
  }
}