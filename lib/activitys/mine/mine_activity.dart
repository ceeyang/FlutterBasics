import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/system/soft_setting_activity.dart';

class MineActivity extends StatefulWidget {
  MineActivity({Key key}) : super(key: key);

  @override
  _MineActivityState createState() => _MineActivityState();
}

class _MineActivityState extends State<MineActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Route route = MaterialPageRoute(builder: (context) => SoftSettingActivity());
            Navigator.push(context, route);
          })
        ],
      ),
    );
  }
}