import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// [PluginTempActivity] 加载/空白 视图类型
/// [PluginTempActivityType.default] default: 默认左边图片  右边两行文字
/// [PluginTempActivityType.value1] value1: 默认左边图片  右边两行文字, 下面一行文字
/// [PluginTempActivityType.value2] value2: 
enum PluginTempActivityType {
  defalut,
  value1,
  value2,
}

/// 默认加载中空白视图
class PluginTempActivity extends StatefulWidget {
  final PluginTempActivityType _type;

  PluginTempActivity({
    Key key, PluginTempActivityType type
  }) : this._type = type ?? PluginTempActivityType.defalut,
       super(key: key);

  @override
  _PluginTempActivityate createState() => _PluginTempActivityate();
}

class _PluginTempActivityate extends State<PluginTempActivity>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
          child: Shimmer.fromColors(
            baseColor: Colors.white24,
            highlightColor: Colors.white70,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return _tempItem();
              },
              itemCount: 8,
            ),
          ),
        ),
    );
  }

  Widget _tempItem() {
    switch (widget._type) {
      case PluginTempActivityType.defalut:
        return Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 130,
                    height: 15,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    height: 15,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ],
          ),
        );
        break;
        
      case PluginTempActivityType.value1:
        return Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 130,
                        height: 15,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 15,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.blueGrey,
                width: MediaQuery.of(context).size.width - 30,
                height: 50,
              ),
            ],
          )
        );
        break;

      case PluginTempActivityType.value2:
        return Container();
        break;

      default:
        throw UnsupportedError("have not support this plugin");
    }
  }
}