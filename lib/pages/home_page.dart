import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper app'),
      ),
      body: Center(
        child: Text('Here can be your advertising'),
      ),
    );
  }
}
