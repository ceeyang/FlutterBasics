import 'package:flutter/material.dart';
import 'package:flutter_basics/plugins/plugin_temp_view.dart';

class ConfigurableActivity extends StatefulWidget {
  ConfigurableActivity({Key key}) : super(key: key);

  @override
  _ConfigurableActivityState createState() => _ConfigurableActivityState();
}

class _ConfigurableActivityState extends State<ConfigurableActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Config")
      ),
      body: PluginTempViewActivity(),
    );
  }
}