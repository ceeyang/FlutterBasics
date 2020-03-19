import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// 默认加载视图类型
enum PluginTempViewActivityType {
  listView,
  detailView,
}

/// 默认加载中空白视图
class PluginTempViewActivity extends StatefulWidget {
  final PluginTempViewActivityType _type;

  PluginTempViewActivity({
    Key key, PluginTempViewActivityType type
  }) : this._type = type,
       super(key: key);

  @override
  _PluginTempViewActivityate createState() => _PluginTempViewActivityate();
}

class _PluginTempViewActivityate extends State<PluginTempViewActivity>{


  Widget tempItem() {
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
  }



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
                return tempItem();
              },
              itemCount: 8,
            ),
          ),
        ),
    );
  }
}