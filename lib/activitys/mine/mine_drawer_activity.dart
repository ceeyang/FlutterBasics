import 'package:flutter/material.dart';
import 'package:flutter_basics/plugins/plugin_page_routes.dart';
import 'package:flutter_basics/utils/support_models.dart';

class MineDrawerActivity extends StatefulWidget {
  MineDrawerActivity({Key key}) : super(key: key);

  @override
  _MineDrawerActivityState createState() => _MineDrawerActivityState();
}

class _MineDrawerActivityState extends State<MineDrawerActivity> {

  List<Pair<String, String>> get _dataSource => [
    Pair("我的资料",r_mine_activity),
    Pair("账号安全", r_mine_activity),
    Pair("版本", r_mine_activity),
    Pair("设置", r_default_activity),
    Pair("退出", r_login_activity),
    Pair("测试", r_test_activity)
  ];

  List<Widget> _getListTitles() {
    List<Widget> items = _dataSource.map((item) => _listTitleWidget(item)).toList();
    items.insert(0, _header());
    return items;
  }

  Widget _listTitleWidget(Pair<String, String> item) {
    return ListTile(
      title: Text(item.first, style: TextStyle(fontSize: 20)),
      onTap: () {
        var target = item.second;
      
        if (target == r_login_activity) {
          var route = MaterialPageRoute(builder: (context) => routeMap[target]);
          Navigator.pushAndRemoveUntil(context, route, (route) => route == null);  
          return;
        }

        if (target != null && target != "") {
          print(routeMap[target]);
          Navigator.push(context, MaterialPageRoute(builder: (context) => routeMap[target]));
        }
      },
    );
  }

  UserAccountsDrawerHeader _header() {
    return UserAccountsDrawerHeader(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: _getListTitles()
      ),
    );
  }
}