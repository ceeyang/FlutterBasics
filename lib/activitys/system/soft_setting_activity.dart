import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/login/login_activity.dart';
import 'package:flutter_basics/configs/app_status_holder.dart';
import 'package:flutter_basics/configs/const_value_key.dart';
import 'package:flutter_basics/utils/support_models.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';
import 'package:flutter_basics/common_widgets/line_menu_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'switch_theme_mode_activity.dart';

/// 软件设置界面,设置软件信息,修改变量值等
class SoftSettingActivity extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SoftSettingActivity> {

  List _appThemes = [ThemeModes.LIGHT, ThemeModes.DARK];

  /// 界面中元素信息
  List<Pair<String, Widget>> get _menuRoutes => [
    Pair("设置主题", SwitchThemeModeActivity()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "设置"
      ),
      body: ListView(
        children: <Widget>[
          getItem(index: 0, briefText: mapThemeMode[_appThemes[gCurrentThemeIndex]], marginTop: true),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 32),
            child: RaisedButton(
              child: Text(
                "退出登录",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Alert(
                  context: context, 
                  title: "确定要退出登录吗？",
                  style: AlertStyle(
                    overlayColor: Colors.black12,
                    backgroundColor: Colors.grey[800],
                    titleStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                  type: AlertType.warning,
                  buttons: [
                    DialogButton(color: Colors.red,child: Text("确定", style: TextStyle(color: Colors.white),), onPressed: (){
                      Route route = MaterialPageRoute(builder: (context) => LoginActivity());
                      Navigator.pushAndRemoveUntil(context, route, ModalRoute.withName("/"));
                    }),
                    DialogButton(color: Colors.grey[300],child: Text("取消", style: TextStyle(color: Colors.white)), onPressed: ()=>Navigator.pop(context),
)
                  ],
                ).show();
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 获取item 对应的 lmv
  Widget getItem({int index, String briefText, bool marginTop = false, bool dividerTop = false}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ? 10 : 0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: dividerTop
            ? Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              )
            : null,
      ),
      child: LineMenuView(
        initParams: LmvParams(
          plugin: LineMenuViewPlugin.LMV_TEXT,
          menuText: _menuRoutes[index].first,
          briefText: briefText,
          briefTextColor: Theme.of(context).textTheme.display1.color,
          briefTextSize: Theme.of(context).textTheme.display1.fontSize,
          navigation: Text(
            String.fromCharCode(Icons.keyboard_arrow_right.codePoint),
            style: TextStyle(
              color: COLOR_ARROW_RIGHT,
              fontSize: IconTheme.of(context).size,
              fontFamily: Icons.keyboard_arrow_right.fontFamily,
              package: Icons.keyboard_arrow_right.fontPackage,
            ),
          ),
        ),
        initListener: LmvListener(onPerformSelf: () {
          var target = _menuRoutes[index].first;
          if (target != null) {
            // 跳转路由 ( 将所有参数都进行传递,用户根据需要来读取对应参数值)
            Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchThemeModeActivity(), settings: RouteSettings(arguments: "")));
          }
        }),
      ),
    );
  }
}
