import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

class EmergencySynergyItemActivity extends StatefulWidget {
  
  final String _title;

  bool _isOpen;

  EmergencySynergyItemActivity({
    Key key,
    String title,
    bool isOpen,
  }) : this._title = title ?? "",
       this._isOpen = isOpen ?? false,
       super(key: key);

  @override
  _EmergencySynergyItemActivityState createState() => _EmergencySynergyItemActivityState();
}

class _EmergencySynergyItemActivityState extends State<EmergencySynergyItemActivity> {

  /// 九宫格高度
  double _gridViewHeight = 70;

  /// 每行多少个
  int _crossAxisCount = 5;

  double _screenWidth,_itemWidth, _itemHeight;

  List<String> dataSource = [
    "fuck",
    "fuck",
    "shit",
    "what?",
    "fuck",
    "shit"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataSource = [];
    for (int i = 0; i < 13; i++) {
      dataSource.add("$i");
    }

    setState(() {});
  }

  Widget _createGridView() {
    return GridView(
      //itemCount: dataSource.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10), // padding
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 0.6, 
        maxCrossAxisExtent: 80
      ),
      children: initListWidget(dataSource)
    );
  }

  _openBtnOnPressed() {
    debugPrint("_openBtnOnPressed");
    setState(() {
      widget._isOpen = !widget._isOpen;
    });
  }

  _buildGridActivity(BuildContext context) {
    return Container(
      height: _gridViewHeight,
      child: GridView.count(
        padding: EdgeInsets.all(LayoutConstant.default_margin),
        //一行多少个
        crossAxisCount: _crossAxisCount,
        //滚动方向
        scrollDirection: Axis.vertical,
        // // 左右间隔
        // crossAxisSpacing: LayoutConstant.default_margin,
        // // 上下间隔
        // mainAxisSpacing: LayoutConstant.default_margin,
        //宽高比
        childAspectRatio: _itemWidth / _itemHeight,
        //设置itemView 
        children: initListWidget(dataSource),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(GestureDetector(
        child: Container(
          // color: randomColor(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment(0, 1.5),
                children: <Widget>[
                  CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/82.jpg"),radius: 30,),
                  Icon(Icons.check_circle, color: Colors.green,)
                ],
              ),
              SizedBox(height: 8),
              Text("姓名: $item"),
              Text("正常", style: TextStyle(color: Colors.green),)
            ],
          ),
        ),
      ));
    }
    return lists;
  }

  _buildTypeTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Container(height: 15, width: 5, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular((5.0))),),
            SizedBox(width: 5),
            Text("人员种类"),
          ],
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 0.5),
              borderRadius: BorderRadius.circular((5.0)), // 圆角度
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 5),
                Text("全部状态", style: TextStyle(color: Colors.blue),),
                Icon(Icons.arrow_drop_down, color: Colors.blue,),
              ],
            ),
          ),
          onTap: (){},
        ),
      ],
    );
  }

  _buildTypeWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(color: Colors.grey[400], height: 1),
        SizedBox(height: 10),
        _buildTypeTitleWidget(),
        _createGridView(),
        // Container(color: Colors.grey[400], height: 1, width: _screenWidth*0.3,),
        // SizedBox(height: 10),
        // _buildTypeTitleWidget(),
        // _buildGridActivity(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           Container(
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFEEF1F5), width: 0.5), // 边色与边宽度
              color: Colors.white, // 底色
              borderRadius: BorderRadius.circular((5.0)), // 圆角度
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300], 
                  offset: Offset(5.0, 5.0), 
                  blurRadius: 10.0, 
                  spreadRadius: 2.0), 
                BoxShadow(
                  color: Color(0xFFEEF1F5), 
                  offset: Offset(1.0, 1.0))],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10),
                        Text(widget._title),
                      ],
                    ),
                    IconButton(
                      icon: Icon(widget._isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down), 
                      onPressed: _openBtnOnPressed
                    )
                  ],
                ),
                widget._isOpen
                 ? _buildTypeWidget(context)
                 : Container(),
              ]
            )
           )
         ],
       )
    );
  }
}