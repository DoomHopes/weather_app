import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home_page_provider.dart';

class HourlyListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => ListView.builder(
        itemCount: providerData.apiModel.hourly.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    constraints: BoxConstraints.tightFor(width: 80.0),
                    child: Image.network('http://openweathermap.org/img/wn/' +
                        providerData.apiModel.hourly[index].weather[0].icon +
                        '.png'),
                  ),
                  title:
                      Text(providerData.apiModel.hourly[index].dt.toString()),
                  subtitle: Text('Temperature: ' +
                      providerData.apiModel.hourly[index].temp.toString()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
