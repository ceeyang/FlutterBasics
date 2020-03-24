import 'package:flutter/material.dart';
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

  Widget profileAvatar(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              print("object");
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),
              radius: 20,
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
        leading: Row(
          children: <Widget>[
            SizedBox(width: 10),
            InkWell(
              onTap:() => _scaffoldKey.currentState.openDrawer(),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),  
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.message), onPressed: (){
            
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