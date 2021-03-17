import 'package:flutter/material.dart';
import 'package:weather_app/models/api_model.dart';

class DailyDetailed extends StatelessWidget {
  final ApiModel apiModel;
  final int index;

  DailyDetailed({this.apiModel, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(apiModel.daily[index].dt.toString().replaceFirst('.000', '')),
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'http://openweathermap.org/img/wn/' +
                    apiModel.daily[index].weather[0].icon +
                    '@2x.png',
              ),
            ),
            Text(
              'Description: ' +
                  apiModel.daily[index].weather[0].description.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'During the day it feels like ' +
                  apiModel.daily[index].feelsLike.day.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Temperature at day: ' +
                  apiModel.daily[index].temp.day.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Temperature at night: ' +
                  apiModel.daily[index].temp.night.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Humidity: ' + apiModel.daily[index].humidity.toString() + '%',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Wind speed: ' +
                  apiModel.daily[index].windSpeed.toString() +
                  ' metre/sec',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Wind direction: ' +
                  apiModel.daily[index].windDeg.toString() +
                  ' degrees',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Probability of precipitation: ' +
                  apiModel.daily[index].pop.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Sunrise: ' +
                  apiModel.daily[index].sunrise
                      .toString()
                      .replaceFirst('.000', ''),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Sunset: ' +
                  apiModel.daily[index].sunset
                      .toString()
                      .replaceFirst('.000', ''),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
