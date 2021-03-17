import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';

class HourlyDetailed extends StatelessWidget {
  final ApiModel apiModel;
  final int index;

  HourlyDetailed({this.apiModel, this.index});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blueAccent,
      child: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'http://openweathermap.org/img/wn/' +
                    apiModel.hourly[index].weather[0].icon +
                    '@2x.png',
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                apiModel.hourly[index].weather[0].description.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).TemperatureAtDay +
                    apiModel.hourly[index].temp.toStringAsFixed(0) +
                    '°',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).Humidity +
                    apiModel.hourly[index].humidity.toString() +
                    '%',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).WindSpeed +
                    apiModel.hourly[index].windSpeed.toString() +
                    S.of(context).metreSec,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).WindDirection +
                    apiModel.hourly[index].windDeg.toString() +
                    ' degrees',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).Probability +
                    apiModel.hourly[index].pop.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
