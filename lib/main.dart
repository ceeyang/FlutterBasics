import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/http/dio_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'activitys/system/switch_support_locale_activity.dart';
import 'configs/app_status_holder.dart';
import 'configs/app_theme_config.dart';
import 'configs/const_value_key.dart';
import 'generated/i18n.dart';
import 'plugins/plugin_event_bus.dart';
import 'plugins/plugin_page_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 程序入口,默认native执行 /lib/main.dart 文件
void main() => runApp(CustomApp());

/// 自定义包裹 app, 实现换肤等功能
class CustomApp extends StatefulWidget {
  @override
  State createState() => _CustomAppState();
}

class _CustomAppState extends State<CustomApp> {
  @override
  void initState() {
    super.initState();
    // 初始化皮肤取值等全局 所需 参数
    SharedPreferences.getInstance().then((it) {
      setState(() {
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
    eventBus.on<SupportLocaleSwitch>().listen((it) {
      setState(() {
        gCurrentSupportLocale = it.currentSupportLocale;
      });
    });
    _init();
  }

  void _init() {
//    DioUtil.openDebug();
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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      debugShowCheckedModeBanner: false,
      theme: themes[gCurrentThemeIndex],
      routes: gActivityRoutes,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate, //Material 组件库所使用的字符串
        GlobalWidgetsLocalizations.delegate, // 在当前的语言中，文字默认的排列方向
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: const Locale('en', '')),
      // 不存对应locale时,默认取值英文
      locale: mapLocales[SupportLocale.values[gCurrentSupportLocale]],
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
