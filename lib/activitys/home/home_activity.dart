import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/mine/message_activity.dart';
import 'package:flutter_basics/activitys/mine/mine_drawer_activity.dart';

class HomeActivity extends StatefulWidget {
  HomeActivity({Key key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void avatarOnpressed(){

  }

  Widget profileAvatar() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),
            ),
          )
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 10,
        leading: profileAvatar(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.message), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MessageActivity()));
          })
        ],
      ),
      body: Center(
        child: Text("home", style: TextStyle(fontSize: 25)),
      ),
      drawer: MineDrawerActivity(),
    );
  }
}