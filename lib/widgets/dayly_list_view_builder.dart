import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:date_time_format/date_time_format.dart';

class DaylyListViewBuilder extends StatelessWidget {
  final ApiModel apiModel;

  DaylyListViewBuilder({this.apiModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apiModel.daily.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  constraints: BoxConstraints.tightFor(width: 80.0),
                  child: Image.network('http://openweathermap.org/img/wn/' +
                      apiModel.daily[index].weather[0].icon +
                      '.png'),
                ),
                title: Text(DateTime.parse(apiModel.daily[index].dt.toString())
                    .toString()),
              ),
            ],
          ),
        );
      },
    );
  }
}

//'Temp max ' +apiModel.daily[index].temp.max.toString() + '\n' +'Temp min ' +apiModel.daily[index].temp.min.toString()
