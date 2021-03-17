import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/widgets/daily_detailed.dart';

class DailyListViewBuilder extends StatefulWidget {
  final ApiModel apiModel;
  DailyListViewBuilder({this.apiModel});

  @override
  _DailyListViewBuilderState createState() => _DailyListViewBuilderState();
}

class _DailyListViewBuilderState extends State<DailyListViewBuilder> {
  int _selectedIndex = 0;

  int setIndex(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.apiModel.daily.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints.tightFor(width: 80.0),
                      child: Image.network('http://openweathermap.org/img/wn/' +
                          widget.apiModel.daily[index].weather[0].icon +
                          '@2x.png'),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      widget.apiModel.daily[index].dt.day.toString() +
                          '.' +
                          widget.apiModel.daily[index].dt.month.toString() +
                          '.' +
                          widget.apiModel.daily[index].dt.year.toString(),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(S.of(context).Temperature +
                        widget.apiModel.daily[index].temp.day
                            .toStringAsFixed(0) +
                        '°'),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
              ),
              onTap: () {
                setIndex(index);
              },
            ),
          ),
        ),
        Expanded(
          child: Text(S.of(context).Temperature +
              widget.apiModel.daily[_selectedIndex].temp.day
                  .toStringAsFixed(0) +
              '°'),
        ),
      ],
    );
  }
}
