import 'package:flutter/cupertino.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';

class HourlyContainer extends Container {
  final ApiModel apiModel;
  final int index;
  final BuildContext context;

  HourlyContainer({this.context, this.apiModel, this.index})
      : super(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 5,
                width: 5,
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
                height: 5,
                width: 5,
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
                height: 5,
                width: 5,
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
                height: 5,
                width: 5,
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
              SizedBox(
                height: 5,
                width: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomLeft,
                child: Text(
                  S.of(context).AtmosphericTemperature +
                      apiModel.hourly[index].dewPoint.toString() +
                      '°',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomLeft,
                child: Text(
                  S.of(context).Cloudiness +
                      apiModel.hourly[index].clouds.toString() +
                      '%',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        );
}
