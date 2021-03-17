import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
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
              /*S.of(context).Description +*/
              apiModel.daily[index].weather[0].description.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).DuringTheDayItFeelsLike +
                  apiModel.daily[index].feelsLike.day.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).TemperatureAtDay +
                  apiModel.daily[index].temp.day.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).TemperatureAtNight +
                  apiModel.daily[index].temp.night.toStringAsFixed(0) +
                  '°',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).Humidity +
                  apiModel.daily[index].humidity.toString() +
                  '%',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).WindSpeed +
                  apiModel.daily[index].windSpeed.toString() +
                  S.of(context).metreSec,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).WindDirection +
                  apiModel.daily[index].windDeg.toString() +
                  ' degrees',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).Probability + apiModel.daily[index].pop.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).Sunrise +
                  apiModel.daily[index].sunrise
                      .toString()
                      .replaceFirst('.000', ''),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            Text(
              S.of(context).Sunset +
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
