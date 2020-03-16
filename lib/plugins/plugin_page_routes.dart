import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/activitys/home/home_activity.dart';
import 'package:flutter_basics/activitys/system/soft_setting_activity.dart';
import 'package:flutter_basics/activitys/system/switch_support_locale_activity.dart';
import 'package:flutter_basics/activitys/system/switch_theme_mode_activity.dart';
import 'package:flutter_basics/mvvm/login/page/login_activity.dart';

/// 当前的所有的Activity (仿 ARouter)
const r_login_activity = "/";
const r_home_activity = "/home_activity";
const r_default_activity = "/setting_activity";
const r_switch_support_locale_activity = "/switch_support_locale_activity";
const r_switch_theme_mode_activity = "/switch_theme_mode_activity";

/// 路由,采用小写模式
const r_main_activity = "/main_activity";

/// 设置跳转的 routes
final Map<String, WidgetBuilder> gActivityRoutes = {
  r_login_activity: (ctx) => LoginActivity(),
  r_home_activity: (ctx) => HomeActivity(),
  r_default_activity: (ctx) => SoftSettingActivity(),
  r_switch_support_locale_activity: (ctx) => SwitchSupportLocaleActivity(),
  r_switch_theme_mode_activity: (ctx) => SwitchThemeModeActivity(),
};
