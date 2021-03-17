import 'package:flutter/material.dart';
import 'package:weather_app/models/api_model.dart';

class HourlyDetailed extends StatelessWidget {
  final ApiModel apiModel;
  final int index;

  HourlyDetailed({this.apiModel, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(apiModel.hourly[index].dt.toString().replaceFirst('.000', '')),
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
                    apiModel.hourly[index].weather[0].icon +
                    '@2x.png',
              ),
            ),
            Text(
              'Description: ' +
                  apiModel.hourly[index].weather[0].description.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'During the day it feels like ' +
                  apiModel.hourly[index].feelsLike.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Temperature at day: ' + apiModel.hourly[index].temp.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Humidity: ' + apiModel.hourly[index].humidity.toString() + '%',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Wind speed: ' +
                  apiModel.hourly[index].windSpeed.toString() +
                  ' metre/sec',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Wind direction: ' +
                  apiModel.hourly[index].windDeg.toString() +
                  ' degrees',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              'Probability of precipitation: ' +
                  apiModel.hourly[index].pop.toString(),
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
