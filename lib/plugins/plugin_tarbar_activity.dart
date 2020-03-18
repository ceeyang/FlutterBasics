import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/home/home_activity.dart';
import 'package:flutter_basics/activitys/mine/mine_activity.dart';
import 'package:flutter_basics/hanlder/hanlder_config.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

class PluginTabarActivity extends StatefulWidget {
  PluginTabarActivity({Key key}) : super(key: key);

  @override
  _PluginTabarActivityState createState() => _PluginTabarActivityState();
}

class _PluginTabarActivityState extends State<PluginTabarActivity> {
  
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeActivity(),
    MineActivity()
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的"))
  ];

  @override
  void initState() {
    super.initState();
    
    log("异步读取 json 文件并加载");
    /// 异步读取 json 文件并加载
    HanlderConfig().loadLoaclConfig().then((config){
      
      log(config);

      pages = HanlderConfig().getBodyPages(config);
      items = HanlderConfig().getTabbarItems(config);
      
      log(pages);
      /// 加载完成后需要调用 setState 变更状态才能刷新页面
      setState(() {
        _currentIndex = 0;
      });
    });
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
        items: items,
        selectedItemColor: Theme.of(context).selectedRowColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      )
    );
  }
}
