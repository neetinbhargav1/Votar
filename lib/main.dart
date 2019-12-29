import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frost/remove_user/main.dart';

import 'homescreen.dart';
void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),

    routes: <String, WidgetBuilder>{
      '/Login': (BuildContext context) => new Home()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
