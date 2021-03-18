import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';

class DailyContainer extends Container {
  final ApiModel apiModel;
  final int index;
  final BuildContext context;
  final Function function;

  DailyContainer({this.context, this.apiModel, this.index, this.function})
      : super(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Text(
                S.of(context).TemperatureAtMorn +
                    apiModel.daily[index].temp.morn.toStringAsFixed(0) +
                    '°',
                style: GoogleFonts.lato(),
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
                S.of(context).TemperatureAtDay +
                    apiModel.daily[index].temp.day.toStringAsFixed(0) +
                    '°',
                style: GoogleFonts.lato(),
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
                S.of(context).TemperatureAtNight +
                    apiModel.daily[index].temp.night.toStringAsFixed(0) +
                    '°',
                style: GoogleFonts.lato(),
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
                    apiModel.daily[index].humidity.toString() +
                    '%',
                style: GoogleFonts.lato(),
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
                    apiModel.daily[index].windSpeed.toString() +
                    S.of(context).metreSec,
                style: GoogleFonts.lato(),
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
                S.of(context).WindDirection +
                    function(apiModel.daily[index].windDeg, context),
                style: GoogleFonts.lato(),
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
                    apiModel.daily[index].pop.toString(),
                style: GoogleFonts.lato(),
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
                S.of(context).Sunrise +
                    apiModel.daily[index].sunrise
                        .toString()
                        .replaceFirst('.000', ''),
                style: GoogleFonts.lato(),
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
                S.of(context).Sunset +
                    apiModel.daily[index].sunset
                        .toString()
                        .replaceFirst('.000', ''),
                style: GoogleFonts.lato(),
              ),
            ),
          ],
        ));
}
