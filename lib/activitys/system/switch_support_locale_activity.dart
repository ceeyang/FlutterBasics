import 'package:flutter/material.dart';
import 'package:flutter_basics/configs/app_status_holder.dart';
import 'package:flutter_basics/configs/const_value_key.dart';
import 'package:flutter_basics/generated/i18n.dart';
import 'package:flutter_basics/plugins/plugin_event_bus.dart';
import 'package:flutter_basics/utils/support_models.dart';
import 'package:flutter_basics/common_widgets/common_lmv_rs_group.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 枚举: 支持的语言种类
enum SupportLocale {
  FOLLOW_SYSTEM,
  SIMPLIFIED_CHINESE,
  ENGLISH,
}

/// SupportLocale -> locale
Map<SupportLocale, Locale> mapLocales = {
  SupportLocale.FOLLOW_SYSTEM: null,
  SupportLocale.SIMPLIFIED_CHINESE: Locale("zh", "CN"),
  SupportLocale.ENGLISH: Locale("en", ""),
};

///SupportLocale 对应的含义
Map<SupportLocale, String> get mapSupportLocale => {
  SupportLocale.FOLLOW_SYSTEM: "跟随系统",
  SupportLocale.SIMPLIFIED_CHINESE: "简体中文",
  SupportLocale.ENGLISH: "English",
};

/// 主界面内容
class SwitchSupportLocaleActivity extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SwitchSupportLocaleActivity> with WidgetsBindingObserver {
  /// 初始状态
  SupportLocale _initS = SupportLocale.values[gCurrentSupportLocale];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).label_switch_support_locale,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 10,
          ),
          CommonLmvRsGroup<SupportLocale>(
            currentMode: _initS,
            menus: () {
              return SupportLocale.values.map((it) {
                return Pair(it, mapSupportLocale[it]);
              });
            }(),
            callback: switchTS,
          ),
        ],
      ),
    );
  }

  /// 切换
  Future<bool> switchTS(SupportLocale old, SupportLocale news) async {
    print("当前系统语言为:${Localizations.localeOf(context)}");
    await (await SharedPreferences.getInstance()).setInt(KEY_SUPPORT_LOCALE, news.index);
    eventBus.fire(SupportLocaleSwitch(currentSupportLocale: news.index));
    setState(() {});
    return true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }
}
