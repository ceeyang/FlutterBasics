import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basics/activitys/login/login_activity.dart';
import 'package:flutter_basics/bean/user.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/http/dio_util.dart';
import 'package:flutter_basics/plugins/plugin_page_routes.dart';
import 'package:flutter_basics/plugins/plugin_tarbar_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configs/app_locale_config.dart';
import 'configs/app_status_holder.dart';
import 'configs/app_theme_config.dart';
import 'configs/const_value_key.dart';
import 'plugins/plugin_event_bus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 自定义包裹 app, 实现换肤等功能
class CustomApp extends StatefulWidget {
  @override
  State createState() => _CustomAppState();
}

class _CustomAppState extends State<CustomApp> {

  bool _hasLogin = false;
  User _user;

  /// 配置 DioUtil
  void _dioUtilConfig() {
    BaseOptions options = DioUtil.getDefOptions();
    options.baseUrl = KConstant.base_url;
    String cookie = SpUtil.getString(KConstant.keyAppToken);
    if (ObjectUtil.isNotEmpty(cookie)) {
      Map<String, dynamic> _headers = new Map();
      _headers["Cookie"] = cookie;
      options.headers = _headers;
    }
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  @override
  void initState() {
    super.initState();
    // 初始化皮肤取值等全局 所需 参数
    SharedPreferences.getInstance().then((it) {
      setState(() {
        _hasLogin = it.getBool(KConstant.keyIsLogined) ?? false;
        gCurrentThemeIndex = it.getInt(KEY_THEME_MODE) ?? 0;
        gCurrentSupportLocale = it.getInt(KEY_SUPPORT_LOCALE) ?? 0;
      });
    });

    // 当通知系统时,刷新一下状态(换肤/切换语言/涨跌颜色)
    eventBus.on<SystemThemeSwitch>().listen((it) {
      setState(() {
        // 修改皮肤
        gCurrentThemeIndex = it.currentThemeIndex;
      });
    });
    
    _dioUtilConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      debugShowCheckedModeBanner: false,
      theme: themes[gCurrentThemeIndex],
      /// 如果指定 home 作为程序主入口, 那么将不能使用 routes 属性
      /// 并且 不能使用 Navigator.pushNamed(context, routeName);
      home: _hasLogin ? PluginTabarActivity() : LoginActivity(), 
      ///routes: gActivityRoutes,
      localizationsDelegates: [
        CupertinoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate, //Material 组件库所使用的字符串
        GlobalWidgetsLocalizations.delegate, // 在当前的语言中，文字默认的排列方向
      ],
      supportedLocales: [const Locale('zh'),]
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

/// 程序入口,默认native执行 /lib/main.dart 文件
/// void main() => runApp(CustomApp());
void main() async{

  SharedPreferences.getInstance().then((it){

  });

  runApp(CustomApp());
}


