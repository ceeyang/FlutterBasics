import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/configurable/widgets/config_moduls_activity.dart';
import 'package:flutter_basics/plugins/plugin_page_routes.dart';
import 'package:flutter_basics/plugins/plugin_temp_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurableActivity extends StatefulWidget {
  ConfigurableActivity({Key key}) : super(key: key);

  @override
  _ConfigurableActivityState createState() => _ConfigurableActivityState();
}

class _ConfigurableActivityState extends State<ConfigurableActivity> with AutomaticKeepAliveClientMixin {

  List<ModulActivity> moduls = [
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
    ModulActivity(icon: "settings", menuText: "设置", target: r_default_activity),
  ];

  @override
  bool get wantKeepAlive => true;

  /// 临时状态  管理是否加载完成
  bool _configLoaded = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((it){
      
    });

    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _configLoaded = true;
      });
    });
  }
  
  _listViewBuilder(BuildContext context) {
    return ListView(
      children: moduls.map((item){
        return CardModulsActivity();
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Config")
      ),
      body: _configLoaded ? _listViewBuilder(context) : PluginTempActivity(),
    );
  }
}