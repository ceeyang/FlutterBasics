import 'package:flutter/material.dart';
import 'package:flutter_basics/configs/app_locale_config.dart';
import 'package:flustars/flustars.dart';

class HomeActivity extends StatefulWidget {
  HomeActivity({Key key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SS.activity_home_title),
        actions: <Widget>[
        ],
      ),
    );
  }
}