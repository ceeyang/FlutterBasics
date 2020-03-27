import 'package:flutter/material.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';

class EmergencySynergyActivity extends StatefulWidget {
  EmergencySynergyActivity({Key key}) : super(key: key);

  @override
  _EmergencySynergyActivityState createState() => _EmergencySynergyActivityState();
}

class _EmergencySynergyActivityState extends State<EmergencySynergyActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "应急协同"),
    );
  }
}