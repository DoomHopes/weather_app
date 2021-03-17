import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';

class HourlyCard extends Card {
  final int index;
  final ApiModel apiModel;
  final BuildContext context;
  HourlyCard({this.apiModel, this.context, this.index})
      : super(
          color: Colors.blueAccent,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.tightFor(width: 80.0),
                child: Image.network('http://openweathermap.org/img/wn/' +
                    apiModel.hourly[index].weather[0].icon +
                    '@2x.png'),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  apiModel.hourly[index].dt.day.toString() +
                      '.' +
                      apiModel.hourly[index].dt.month.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  apiModel.hourly[index].dt.hour.toString() +
                      '.' +
                      apiModel.hourly[index].dt.minute.toString() +
                      '0',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  S.of(context).Temperature +
                      apiModel.hourly[index].temp.toStringAsFixed(0) +
                      '°',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Flexible(
                child: Container(
                  width: 100,
                  child: Text(
                    apiModel.hourly[index].weather[0].description.toString(),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
            ],
          ),
        );
}
