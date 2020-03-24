import 'package:flutter/material.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

class ModulActivity {
  
  /// 图标
  String icon;

  String menuText;
  double menuTextSize;

  String target;

  Object arguments;

  ModulActivity({
    this.icon,
    this.menuText,
    this.menuTextSize,
    this.target,
    this.arguments,
  }) {
    menuText = menuText ?? "";
  }
}

// class ModulsActivity extends StatefulWidget {

  // final ModulParams _initParams;
  // final ModulListener _initListener;

  // ModulsActivity({
  //   Key key,
  //   ModulParams params,
  //   ModulListener listener
  // }) : this._initParams = params != null ?  params : ModulParams(),
  //      this._initListener = listener,
  //      super(key: key);

//   @override
//   _ModulsActivityState createState() => _ModulsActivityState();
// }

// class _ModulsActivityState extends State<ModulsActivity> {

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double margin = LayoutConstant.default_margin;
//     /// 圆角
//     ShapeBorder shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)));
//     return Card(
//       margin: EdgeInsets.fromLTRB(margin, margin, margin, 0),
//       elevation: 5, /// 阴影
//       color: randomColor(),
//       shape: shape, /// 设置圆角
//       child: SizedBox(
//         height: 200,
//       ),
//     );
//   }
// }


class CardModulsParams {
  /// 标题, 默认无标题
  String text;
  /// 字体大小 默认 15 号字体
  double menuTextSize;
  /// 每行多少个 默认 5个/行
  int numberOfRow;
  /// item 模型
  ModulActivity modul;

  CardModulsParams({
    this.text,
    this.menuTextSize,
    this.numberOfRow,
    this.modul
  });
}

class CardModulsActivity extends StatefulWidget {

  final CardModulsParams _cardModulsParams;  

  CardModulsActivity({
    Key key,
    CardModulsParams params
  }) : this._cardModulsParams = params,
       super(key: key);

  @override
  _CardModulsActivityState createState() => _CardModulsActivityState();
}

class _CardModulsActivityState extends State<CardModulsActivity> {
  
  Widget modulBuild(CardModulsParams item) {

  }
  
  @override
  Widget build(BuildContext context) {
    double margin = LayoutConstant.default_margin;
    /// 圆角
    ShapeBorder shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)));
    return Card(
      margin: EdgeInsets.fromLTRB(margin, margin, margin, 0),
      elevation: 5, /// 阴影
      color: randomColor(),
      shape: shape, /// 设置圆角
      child: SizedBox(
        height: 200,
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}