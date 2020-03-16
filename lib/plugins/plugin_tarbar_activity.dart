import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/home/home_activity.dart';
import 'package:flutter_basics/activitys/mine/mine_activity.dart';
import 'package:flutter_basics/activitys/modul/moduls_activity.dart';
import 'package:flutter_basics/generated/i18n.dart';

class PluginTabarActivity extends StatefulWidget {
  PluginTabarActivity({Key key}) : super(key: key);

  @override
  _PluginTabarActivityState createState() => _PluginTabarActivityState();
}

class _PluginTabarActivityState extends State<PluginTabarActivity> {
  List<Widget> pages = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pages
      ..add(HomeActivity())
      ..add(ModulsActivity())
      ..add(MineActivity());
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return


      Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text(S.of(context).tab_home_title)),
          BottomNavigationBarItem(icon: Icon(Icons.menu),title: Text(S.of(context).tab_menu_title)),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text(S.of(context).tab_mine_title)),
        ],
        selectedItemColor: Theme.of(context).selectedRowColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      )
    );
  }
}