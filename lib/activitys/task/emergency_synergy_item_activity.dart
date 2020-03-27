import 'package:flutter/material.dart';

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

  double _gridViewHeight = 70;

  List<String> dataSource = [
    "fuck",
    "fuck",
    "shit",
    "what?",
    "fuck",
    "shit",
    "what?",
    "fuck",
    "shit",
    "what?",
    "shit",
    "what?",
    "kidding?",
    "23333"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    double numberOfLine = (dataSource.length ~/ 5).toInt().toDouble() + (dataSource.length % 5 == 0 ? 0.0 : 1.0);
    print("numberOfLine: $numberOfLine");

    _gridViewHeight = numberOfLine * 65.0 + 20.0;

    debugPrint("$_gridViewHeight");

  }

  _openBtnOnPressed() {
    debugPrint("_openBtnOnPressed");
    setState(() {
      widget._isOpen = !widget._isOpen;
    });
  }

  _buildGridActivity() {
    return Container(
      height: _gridViewHeight,
      child: GridView.count(
        padding: EdgeInsets.all(10.0),
        //一行多少个
        crossAxisCount: 5,
        //滚动方向
        scrollDirection: Axis.vertical,
        // 左右间隔
        crossAxisSpacing: 10.0,
        // 上下间隔
        mainAxisSpacing: 10.0,
        //宽高比
        childAspectRatio: 2 / 2,
        //设置itemView 
        children: initListWidget(dataSource),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(Container(
        // height: 50.0,
        // width: 50.0,
        color: Colors.yellow,
        child: Center(
            child: Text(item)),
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

  _buildTypeWidget() {
    return Column(
      children: <Widget>[
        Container(color: Colors.grey[400], height: 1),
        SizedBox(height: 10),
        _buildTypeTitleWidget(),
        _buildGridActivity(),
        _buildTypeTitleWidget(),
        _buildGridActivity(),
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
                 ? _buildTypeWidget()
                 : Container(),
              ]
            )
           )
         ],
       )
    );
  }
}