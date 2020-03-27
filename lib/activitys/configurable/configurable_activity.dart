import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/configurable/widgets/config_moduls_activity.dart';
import 'package:flutter_basics/activitys/task/emergency_synergy_activity.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';
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

  Widget profileAvatar() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              //_scaffoldKey.currentState.openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("张三", style: TextStyle(fontSize: 20, color: Colors.black),),
              Text("18000000000", style: TextStyle(fontSize: 15, color: Colors.black),)
            ],
          )
        ],
      );
  }

  Widget _appBar() {

    var route = MaterialPageRoute(builder: (BuildContext context) {
      return EmergencySynergyActivity();
    });

    return CustomAppBar(
      leadingWidget: profileAvatar(), 
      trailingWidget: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: ()=> Navigator.of(context).push(route)),
          IconButton(icon: Icon(Icons.settings), onPressed: ()=> Navigator.of(context).push(route)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _appBar(),
      body: _configLoaded ? _listViewBuilder(context) : PluginTempActivity(),
    );
  }
}