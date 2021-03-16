import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class DailyListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => ListView.builder(
        itemCount: providerData.apiModel.daily.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    constraints: BoxConstraints.tightFor(width: 80.0),
                    child: Image.network('http://openweathermap.org/img/wn/' +
                        providerData.apiModel.daily[index].weather[0].icon +
                        '.png'),
                  ),
                  title: Text(providerData.apiModel.daily[index].dt.toString()),
                  subtitle: Text('Daytime temperature ' +
                      providerData.apiModel.daily[index].temp.day.toString()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
