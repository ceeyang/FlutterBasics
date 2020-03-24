import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/activitys/configurable/configurable_activity.dart';
import 'package:flutter_basics/activitys/home/home_activity.dart';
import 'package:flutter_basics/activitys/mine/mine_activity.dart';
import 'package:flutter_basics/activitys/system/soft_setting_activity.dart';
import 'package:flutter_basics/activitys/system/switch_theme_mode_activity.dart';
import 'package:flutter_basics/activitys/login/login_activity.dart';
import 'package:flutter_basics/activitys/test/test_activity.dart';

/// 当前的所有的Activity (仿 ARouter)
const r_login_activity = "/";
const r_home_activity = "/home_activity";
const r_default_activity = "/setting_activity";
const r_switch_theme_mode_activity = "/switch_theme_mode_activity";
const r_configable_activity = "/configurable_activity";
const r_mine_activity = "/mine_activity";
const r_test_activity = "/test_activity";

/// 路由,采用小写模式
const r_main_activity = "/main_activity";

/// 设置跳转的 routes
final Map<String, WidgetBuilder> gActivityRoutes = {
  r_login_activity: (ctx) => LoginActivity(),
  r_home_activity: (ctx) => HomeActivity(),
  r_default_activity: (ctx) => SoftSettingActivity(),
  r_switch_theme_mode_activity: (ctx) => SwitchThemeModeActivity(),
  r_configable_activity: (ctx) => ConfigurableActivity(),
  r_mine_activity: (ctx) => MineActivity(),
};

final Map<String, Widget> routeMap = {
  r_login_activity: LoginActivity(),
  r_home_activity: HomeActivity(),
  r_default_activity: SoftSettingActivity(),
  r_switch_theme_mode_activity: SwitchThemeModeActivity(),
  r_configable_activity: ConfigurableActivity(),
  r_mine_activity: MineActivity(),
  r_test_activity: SampleAppPage()
};

Widget getTarget(String name) {
  return routeMap[name];
}