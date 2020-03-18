import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

/// [ModulWidgetPlugin] 插件类型
/// [MODUL_DEFAULT] default 默认类型,无 title
/// [MODUL_WITHTITLE] withTitle 默认类型的基础上有 title
enum ModulWidgetPlugin {
  MODUL_DEFAULT,
  MODUL_WITHTITLE,
}

class ModulWidgetParams {

  /// 标题
  String title;

  /// 插件类型
  ModulWidgetPlugin plugin;

  List<String> menuTexts;
  List<Icon> menuIcons;
  
  /// 整体距离左右两边间距
  Double margin;
  /// 一行显示多少个
  int numberOfLine;

  ModulWidgetParams({
    this.plugin,
    this.menuTexts,
    this.menuIcons,
    this.margin,
    this.numberOfLine,
  });
}

/// [ModulWidget] 添加监听事件
class ModulWidgentListener {

  /// ModulWidget 点击事件
  void Function() onPreset;

  ModulWidgentListener({this.onPreset});
}

class ModulWidget extends StatefulWidget {
  //ModulWidget({Key key}) : super(key: key);

  final ModulWidgetParams params;
  final ModulWidgentListener listener;

  @override
  _ModulWidgetState createState() => _ModulWidgetState();

  ModulWidget({
    Key key,
    ModulWidgetParams params,
    ModulWidgentListener listener
  }) : this.params = params != null ? params : ModulWidgetParams(),
       this.listener = listener,
       super(key: key);
}

class _ModulWidgetState extends State<ModulWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: randomColor(),
      type: MaterialType.transparency,
      child: Container(
         color: randomColor(),
         padding: EdgeInsets.all(15),
         child: Center(
           child: Text("What the fuck"),
         ),
      ),
    );
  }
}