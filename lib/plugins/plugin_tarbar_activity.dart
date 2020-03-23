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
  var _pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

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
    
    /// 异步读取 json 文件并加载
    HanlderConfig().loadLoaclConfig().then((config){
      
      HanlderConfigResult result = HanlderConfig().getTabBarItemAndPages(config);
      pages = result.widgets;
      items = result.items;
      
      /// 加载完成后需要调用 setState 变更状态才能刷新页面
      setState(() {
        _currentIndex = 0;
      });
    });
  }

  /// tabbar 点击事件
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  /// 页面滚动事件
  void _pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// 创建 body
  Widget _pageViewBuilder() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _pageChanged,
      //回调函数
      itemCount: pages.length,
      itemBuilder: (context, index) => pages[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      //body: pages[_currentIndex],
      body: _pageViewBuilder(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        selectedItemColor: Theme.of(context).selectedRowColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}