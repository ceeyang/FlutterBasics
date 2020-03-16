import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/login/login_activity.dart';
import 'package:flutter_basics/configs/app_locale_config.dart';
import 'package:flutter_basics/configs/app_status_holder.dart';
import 'package:flutter_basics/configs/const_value_key.dart';
import 'package:flutter_basics/generated/i18n.dart';
import 'package:flutter_basics/plugins/plugin_page_routes.dart';
import 'package:flutter_basics/utils/support_models.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';
import 'package:flutter_basics/common_widgets/line_menu_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'switch_support_locale_activity.dart';
import 'switch_theme_mode_activity.dart';

/// 软件设置界面,设置软件信息,修改变量值等
class SoftSettingActivity extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SoftSettingActivity> {

  /// 界面中元素信息
  List<Pair<String, String>> get _menuRoutes => [
        Pair(SS.label_switch_theme_mode, r_switch_theme_mode_activity),
        Pair(SS.label_switch_support_locale, r_switch_support_locale_activity),
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 系统语言改变时,如果当前为跟随系统,则需要修改字符串读取对象
    if (gCurrentSupportLocale == 0) {
      print("当前系统语言为:${Localizations.localeOf(context)}");
      ss[0] = S.of(context);
      print(ss);
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).label_soft_setting,
      ),
      body: ListView(
        children: <Widget>[
          getItem(index: 0, briefText: mapThemeMode[ThemeModes.values[gCurrentThemeIndex]], marginTop: true),
          getItem(index: 1, briefText: mapSupportLocale[SupportLocale.values[gCurrentSupportLocale]], marginTop: true),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 32),
            child: RaisedButton(
              child: Text(
                S.of(context).activity_soft_setting_login,
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
          var target = _menuRoutes[index].second;
          if (target != null && target != "/") {
            // 跳转路由 ( 将所有参数都进行传递,用户根据需要来读取对应参数值)
            Navigator.pushNamed(context, target, arguments: {
              // ...
            }).then((it) {
              // 需要重新刷新状态
              if (it == true) {
                // ...
              }
            });
          }
        }),
      ),
    );
  }
}
