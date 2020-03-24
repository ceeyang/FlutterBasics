import 'package:flutter/material.dart';
import 'package:flutter_basics/configs/app_status_holder.dart';
import 'package:flutter_basics/configs/const_value_key.dart';
import 'package:flutter_basics/plugins/plugin_event_bus.dart';
import 'package:flutter_basics/utils/support_models.dart';
import 'package:flutter_basics/common_widgets/common_lmv_rs_group.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 枚举: 主题模式
/// [ThemeModes.LIGHT]  白天模式
/// [ThemeModes.DARK] 夜间模式
enum ThemeModes {
  LIGHT,
  DARK,
}

///ThemeMode 对应的含义
Map<ThemeModes, String> get mapThemeMode => {
  ThemeModes.LIGHT: "白天模式",
  ThemeModes.DARK: "夜间模式"
};

/// 主界面内容
class SwitchThemeModeActivity extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SwitchThemeModeActivity> {
  /// 初始状态
  ThemeModes _initS;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _initS = ThemeModes.values[gCurrentThemeIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "选择主题",
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 10,
          ),
          CommonLmvRsGroup<ThemeModes>(
            currentMode: _initS,
            menus: () {
              return ThemeModes.values.map((it) {
                return Pair(it, mapThemeMode[it]);
              });
            }(),
            callback: switchTS,
          ),
        ],
      ),
    );
  }

  /// 切换
  Future<bool> switchTS(ThemeModes old, ThemeModes news) async {
    await (await SharedPreferences.getInstance()).setInt(KEY_THEME_MODE, news.index);
    eventBus.fire(SystemThemeSwitch(currentThemeIndex: news.index));
    setState(() {});

    return true;
  }
}