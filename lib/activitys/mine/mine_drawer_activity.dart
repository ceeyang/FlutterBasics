import 'package:flutter/material.dart';

class MineDrawerActivity extends StatefulWidget {
  MineDrawerActivity({Key key}) : super(key: key);

  @override
  _MineDrawerActivityState createState() => _MineDrawerActivityState();
}

class _MineDrawerActivityState extends State<MineDrawerActivity> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("ceeyang", style: TextStyle(
              fontSize: 20,
            ),), 
            accountEmail: Text("2020-03-24"),
            currentAccountPicture: InkWell(
              onTap: (){
                print("account picture on tap");
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text("我的资料", textAlign: TextAlign.start,),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("账号安全", textAlign: TextAlign.start,),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("版本", textAlign: TextAlign.start,),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("退出", textAlign: TextAlign.start,),
            onTap: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}