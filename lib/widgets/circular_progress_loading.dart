import 'package:flutter/material.dart';

class CircularProgressLoading extends StatelessWidget {
  const CircularProgressLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          const SizedBox(width: 40.0),
          Text('Loading data ....'),
        ],
      ),
    );
  }
}
